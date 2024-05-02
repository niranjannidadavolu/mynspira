
using System.Data;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Infrastructure.Dapper;
using System.Threading.Tasks;
using Phoenix.Model.Business.Administration;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Dapper;
using System.Text;
using Phoenix.Model.Business.Employee;
using Phoenix.Database.Repository.Employee;
using System;
using System.Collections.Generic;
using OtpNet;
using Dapper.Oracle;
using System.Linq;
using Phoenix.CrossCutting.Resources;
using System.Text.RegularExpressions;
using Phoenix.Model.Business.Helper;
using RestSharp;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.EmployeeVerification.Equal;
using System.Security.Cryptography.Xml;
using RestSharp.Authenticators;
using Newtonsoft.Json;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.CrossCutting.Utils.Token;

namespace Phoenix.Database.Repository.Administration
{
    public class UserInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly ICryptography cryptography;
        private readonly IDistributedCache redisCache;
        private readonly IJwtAuthManager jwtAuthManager;
        public UserInformationRepository(IConfiguration configuration, ICryptography cryptography, IDistributedCache redisCache, IJwtAuthManager jwtAuthManager) : base(configuration)
        {
            this.configuration = configuration;
            this.cryptography = cryptography;
            this.redisCache = redisCache;
            this.jwtAuthManager = jwtAuthManager;

        }

        public async Task<bool> ActivateUser(long employeeSlno)
        {
            int updatedRecords = 0;
            string loginQuery = "UPDATE HR_EMPLOYEE_MT SET STATUS = 1 WHERE EMPLOYEESLNO = {0}";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                string query = string.Format(loginQuery, employeeSlno);
                updatedRecords = await connection.ExecuteAsync(query);
            }

            return updatedRecords > 0;

        }


        private async Task<string> GetEqualToken(string customizedId, EmployeeProfile profile)
        {

            RestClientOptions options = new RestClientOptions(EqualSettings.Current.EqualInitGateWayUrl)
            {
                Timeout = -1
            };

            string validationKey = EqualSettings.Current.ExperiencedPerson;

            InitiateRequest request = new InitiateRequest()
            {
                idempotency_id = customizedId,
                //gateway_instance_id = EqualSettings.Current.GateWayInstance,
                gateway_instance_id = profile.EqualGateWay,
                keys = new List<Key>()
            };
            var client = new RestClient(options);
            var restRequest = new RestRequest(EqualSettings.Current.InitializeTransaction, Method.Post);
            client.Authenticator = new HttpBasicAuthenticator(EqualSettings.Current.ClientId, EqualSettings.Current.ClientSecret);
            restRequest.AddHeader("Content-Type", "application/json");
            var body = JsonConvert.SerializeObject(request);
            restRequest.AddStringBody(body, DataFormat.Json);
            RestResponse response = await client.ExecuteAsync(restRequest);

            TokenResponse tokenResponse = JsonConvert.DeserializeObject<TokenResponse>(response.Content);
            return tokenResponse.token;
        }
        public async Task<bool> FetchEqualVerificationDetials(string token)
        {
            RestClientOptions options = new RestClientOptions(EqualSettings.Current.EqualGateWayUrl)
            {
                Timeout = -1
            };

            var client = new RestClient(options);
            var request = new RestRequest(EqualSettings.Current.FetchData, Method.Post);
            client.Authenticator = new HttpBasicAuthenticator(EqualSettings.Current.ClientId, EqualSettings.Current.ClientSecret);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Accept", "application/json");
            //request.AddParameter("application/json", token, ParameterType.RequestBody);
            string body = string.Format("\"{0}\"", token);
            request.AddStringBody(body, DataFormat.Json);
            RestResponse response = await client.ExecuteAsync(request);
            TokenResponse tokenResponse = JsonConvert.DeserializeObject<TokenResponse>(response.Content);

            return tokenResponse.status == "SUCCESS";
        }
        public async Task<UserInformation> AuthenticateUser(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            string password = string.Empty;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iUSERID", loginInformation.UserName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                userInformation = connection.QueryFirstOrDefault<UserInformation>(DatabaseProcedures.VALIDATE_USER, parameters, commandType: CommandType.StoredProcedure);
            }
            if (userInformation != null)
            {
                string plianText = string.Empty;
                if (!string.IsNullOrEmpty(userInformation.PasswordSalt))
                {
                    password = cryptography.Encrypt(loginInformation.Password, userInformation.PasswordSalt);
                    plianText = cryptography.Decrypt(userInformation.Password, userInformation.PasswordSalt);
                }
                if (userInformation.Password == password)
                {
                        JwtAuthResult token = jwtAuthManager.GenerateToken(userInformation);
                    userInformation.Token = token.AccessToken;
                    userInformation.RefreshToken = token.RefreshToken;
                    userInformation.MappedScreens = await GetMappedScreens(userInformation.EmployeeSlno);
                    await SaveLoginTries(userInformation.EmployeeSlno);
                    EmployeeProfile profile = await GetEmployeeMinimalProfile(userInformation.EmployeeSlno);

                    if (ApplicationSettings.Current.AllowEmployeeVerification)
                    {
                        if (!userInformation.IsVerified && profile.IsVerificationRequired)
                        {
                            userInformation.IdempotencyId = await GetIdempotencyId(userInformation.EmployeeSlno, userInformation.CustomizedId);
                            //Get the Token from the Equal In API.
                            string equalToken = await GetEqualToken(userInformation.IdempotencyId, profile);
                            userInformation.EqualToken = equalToken;
                            userInformation.ClientId = EqualSettings.Current.ClientId;
                        }
                    }
                    else
                    {
                        userInformation.IsVerified = true;
                    }
                    //userInformation.ReportingStructure = await GetEmployeeReportingStructure(userInformation.EmployeeSlno);
                }
                else
                {
                    userInformation = null;
                }
            }
            userInformation.IsVerified = true;
            return userInformation;
        }
        
        private async Task SaveEmployeeVerification(int employeeslno, string idempotencyId)
        {
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "IEMPLOYEESLNO", employeeslno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "IIDEMPOTENCY_ID", idempotencyId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_EMP_VERIFICATION, parmeters, commandType: CommandType.StoredProcedure);
            }
        }

        private async Task<string> GetIdempotencyId(int employeeSlno, string customizedId)
        {
            string idempotencyId = string.Empty;
            UserInformation firstData = null;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add(name: "IUSERID", customizedId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbScreenInformations = await connection.QueryAsync<UserInformation>(DatabaseProcedures.GET_IDEMPOTENCY_ID, parameters, commandType: CommandType.StoredProcedure);
                if (dbScreenInformations != null)
                {
                    firstData = dbScreenInformations.FirstOrDefault();
                }
            }
            if(firstData != null)
            {
                idempotencyId = firstData.IdempotencyId;
            }
            else
            {
                idempotencyId = Guid.NewGuid().ToString();
                //save idempotencyId
                await SaveEmployeeVerification(employeeSlno, idempotencyId);

            }
            return idempotencyId;
        }

        public async Task<UserInformation> AuthenticateUserForNerp(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            string password = string.Empty;

            string encryptedPassword = PasswordEncrypt.PasswordEncrypt.EncriptText(loginInformation.Password);


            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iUSERID", loginInformation.UserName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iPASSWORD", encryptedPassword, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR1", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                userInformation = connection.QueryFirstOrDefault<UserInformation>(DatabaseProcedures.P_WEB_HS_USER_SELECT, parameters, commandType: CommandType.StoredProcedure);
            }
            if (userInformation != null && userInformation.UserId > 0)
            {
                userInformation.CustomizedId = loginInformation.UserName;
                JwtAuthResult token = jwtAuthManager.GenerateToken(userInformation);
                userInformation.Token = token.AccessToken;
                userInformation.RefreshToken = token.RefreshToken;
            }
            return userInformation;
        }
        public async Task<UserInformation> ValidateUser(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            string password = string.Empty;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iUSERID", loginInformation.UserName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                userInformation = connection.QueryFirstOrDefault<UserInformation>(DatabaseProcedures.VALIDATE_USER, parameters, commandType: CommandType.StoredProcedure);
            }
            if (userInformation != null)
            {
                string plianText = string.Empty;
                if (!string.IsNullOrEmpty(userInformation.PasswordSalt))
                {
                    password = cryptography.Encrypt(loginInformation.Password, userInformation.PasswordSalt);
                    plianText = cryptography.Decrypt(userInformation.Password, userInformation.PasswordSalt);
                }
                if (userInformation.Password == password)
                {
                    JwtAuthResult token = jwtAuthManager.GenerateToken(userInformation);
                    userInformation.Token = token.AccessToken;
                    userInformation.RefreshToken = token.RefreshToken;
                    await SaveLoginTries(userInformation.EmployeeSlno);
                    EmployeeProfile profile = await GetEmployeeMinimalProfile(userInformation.EmployeeSlno);                    
                    userInformation.IsVerified = true;
                }
                else
                {
                    userInformation = null;
                }
            }
            return userInformation;
        }

        public async Task<List<BranchInformation>> GetUserBranchesFromNerp(int userSlno)
        {
            List<BranchInformation> mappedBranches = null;
            List<DbBranchInformation> dbBranches = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iUSERSLNO", userSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR1", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var x = await connection.QueryAsync<DbBranchInformation>(DatabaseProcedures.P_WEB_HS_BRA_BLD_SELECT, parameters, commandType: CommandType.StoredProcedure);
                dbBranches = x.ToList();
            }
            if (dbBranches != null)
            {
                mappedBranches = dbBranches.GroupBy(x => new { x.BranchSlno, x.Branch_Name, x.Apex_Name }).Select(x =>
                new BranchInformation()
                {
                    BranchName = x.Key.Branch_Name,
                    ApexName = x.Key.Apex_Name,
                    BranchSlno = x.Key.BranchSlno,
                    Buildings = x.Select(y => new BuildingInformation() { BuildingSlno = y.BuildingSlno, BuildingName = y.BuildingName }).ToList()
                }).ToList();
            }

            return mappedBranches;
        }
        public async Task<UserInformation> ValidateAndAuthenticateUser(string userName)
        {
            UserInformation userInformation = null;
            string loginQuery = "SELECT * FROM HR_EMPLOYEE_MT WHERE CUSTOMIZEDID = '{0}' AND STATUS=1";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                string query = string.Format(loginQuery, userName);
                userInformation = await connection.QueryFirstOrDefaultAsync<UserInformation>(query);
                userInformation.UserName = userName;
            }
            if (userInformation != null)
            {
                JwtAuthResult token = jwtAuthManager.GenerateToken(userInformation);
                userInformation.Token = token.AccessToken;
                userInformation.RefreshToken = token.RefreshToken;
                userInformation.MappedScreens = await GetMappedScreens(userInformation.EmployeeSlno);
                await SaveLoginTries(userInformation.EmployeeSlno);
            }
            return userInformation;
        }
        public async Task<UserInformation> RefreshTokenValidateAndAuthenticateUser(UserInformation userInformation)
        {
            if (userInformation != null)
            {
                // JwtAuthResult token = jwtAuthManager.GenerateToken(userInformation);
                JwtAuthResult token = jwtAuthManager.Refresh(userInformation);
                userInformation.Token = token.AccessToken;
                userInformation.RefreshToken = token.RefreshToken;
                userInformation.MappedScreens = await GetMappedScreens(userInformation.EmployeeSlno);
                await SaveLoginTries(userInformation.EmployeeSlno);
            }
            return userInformation;
        }

        public async Task SaveLoginTries(long employeeSlno)
        {
            bool isSaved = false;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "IEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "ILOGIN_STATUS", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                await connection.ExecuteAsync(DatabaseProcedures.SP_INSERT_LOGIN_TRIES, parmeters, commandType: CommandType.StoredProcedure);
            }
        }


        public async Task<List<RoleInformation>> GetMappedRoles(int employeeSlno)
        {
            List<RoleInformation> mappedRoles = null;
            using (RoleInformationRepository dashboardRepository = new(configuration, redisCache))
            {
                mappedRoles = await dashboardRepository.GetMappedRoles(employeeSlno);
            }
            return mappedRoles;
        }

        public async Task<bool> SaveOrUpdateUser(UserInformation userInformation)
        {
            bool isSaved = false;
            List<int> selectedRoles = userInformation.UserRoles.Select(x => x.RoleId).ToList();
            int updatedRecords = 0;
            int rowsUpdated = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iROLES", selectedRoles.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, selectedRoles.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parmeters.Add(name: "iEMPLOYEESLNO", userInformation.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iLOGGED_IN_USER", userInformation.UserId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_USER_ROLES, parmeters, commandType: CommandType.StoredProcedure);
                rowsUpdated = parmeters.Get<int>("AFFECTEDROWCOUNT");
            }

            isSaved = rowsUpdated > 0;
            return isSaved;
        }


        public async Task<bool> DeActivateUser(long employeeSlno)
        {
            int updatedRecords = 0;
            string loginQuery = "UPDATE HR_EMPLOYEE_MT SET STATUS = 0 WHERE EMPLOYEESLNO = {0}";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                string query = string.Format(loginQuery, employeeSlno);
                updatedRecords = await connection.ExecuteAsync(query);
            }

            return updatedRecords > 0;
        }

        public async Task<EmployeeProfile> GetEmployeeProfile(int employeeSlno)
        {
            return await GetEmployeeMinimalProfile(employeeSlno);
        }

        private async Task<List<ScreenInformation>> GetMappedScreens(int employeeSlno)
        {
            List<ScreenInformation> mappedScreens = null;
            List<ScreenInformation> menuItems = null;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbScreenInformations = await connection.QueryAsync<ScreenInformation>(DatabaseProcedures.P_GET_EMPLOYEE_SCREENS, parameters, commandType: CommandType.StoredProcedure);
                mappedScreens = dbScreenInformations.ToList();
            }
            menuItems = GetMenuItems(mappedScreens);
            return menuItems;
        }

        private List<ScreenInformation> GetMenuItems(List<ScreenInformation> mappedScreens)
        {
            mappedScreens = mappedScreens.DistinctBy(x => x.ScreenId).ToList();
            List<ScreenInformation> menuItems = mappedScreens.Where(x => x.ParentScreenId == null).OrderBy(x => x.DisplayOrder).ToList();
            foreach (var item in menuItems)
            {
                item.SubItems = GetSubMenuItems(mappedScreens, item.ScreenId);
            }
            return menuItems;
        }

        private List<ScreenInformation> GetSubMenuItems(List<ScreenInformation> mappedScreens, int screenId)
        {
            List<ScreenInformation> menuItems = mappedScreens.Where(x => x.ParentScreenId == screenId).OrderBy(x => x.DisplayOrder).ToList();
            foreach (var item in menuItems)
            {
                item.SubItems = GetSubMenuItems(mappedScreens, item.ScreenId);
            }
            return menuItems;
        }

        public async Task<OtpData> GetOtp(string userName, bool isSignUp)
        {
            UserInformation dbUserInformation = null;
            bool result = false;
            string otpValue = string.Empty;
            string otpMessage = string.Empty;
            OtpData otpData = null;
            string loginQuery = "SELECT * FROM HR_EMPLOYEE_MT WHERE CUSTOMIZEDID = '{0}' AND STATUS =1";
            string insertQuery = "insert into HR_EMPLOYEE_OTP_DT(EMPLOYEESLNO, RECORD_NUMBER, GENERATED_OTP, CUSTOMIZEDID,ISSIGNUP) values({0}, SEQ_HR_OTP.nextval, '{1}', '{2}',{3})";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                dbUserInformation = await connection.QueryFirstOrDefaultAsync<UserInformation>(new StringBuilder().AppendFormat(loginQuery, userName).ToString());
                if (dbUserInformation != null)
                {
                    otpData = new OtpData();
                    EmployeeProfile employeeProfile = await GetEmployeeMinimalProfile(dbUserInformation.EmployeeSlno);
                    otpValue = GenerateOtp();
                    insertQuery = string.Format(insertQuery, dbUserInformation.EmployeeSlno, otpValue, dbUserInformation.CustomizedId, Convert.ToInt32(isSignUp));
                    await connection.ExecuteAsync(insertQuery);


                    string OTPMessage = ApplicationSettings.Current.OTPMessage;
                    otpMessage = string.Format(OTPMessage, Environment.NewLine, otpValue, Environment.NewLine, ApplicationSettings.Current.OtpTimeOut, Environment.NewLine);
                    OracleDynamicParameters parmeters = new OracleDynamicParameters();
                    string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                    parmeters.Add(name: "iMOBILENUMBER", employeeProfile.Mobile, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iMESSAGE", string.Format(otpMessage, dbUserInformation.UserName, otpValue), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iMESSAGESOURCESLNO", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iOFFICETYPESLNO", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);

                    parmeters.Add(name: "iSENDER", "NGROUP", dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iTRAITEMPLATEID", templateid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    await connection.ExecuteAsync(SMS_WhatsApp.SEND_SMS, parmeters, commandType: CommandType.StoredProcedure);

                    otpData.MobileNumber = Regex.Replace(employeeProfile.Mobile.ToString(), @"\d(?!\d{0,3}$)", "X");
                    otpData.IsOtpSent = true;
                }
            }

            return otpData;
        }

        public async Task<bool> ValidateOtp(string userName, string otpValue)
        {
            UserInformation dbUserInformation = null;
            int updatedRows = 0;

            bool isOtpVerfied = false;
            isOtpVerfied = ValidateOtp(otpValue);
            string loginQuery = "SELECT GENERATED_OTP FROM HR_EMPLOYEE_OTP_DT WHERE CUSTOMIZEDID = '{0}' AND STATUS = 0 ORDER BY CREATED_DATE DESC";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                string dbOtpValue = await connection.ExecuteScalarAsync<string>(new StringBuilder().AppendFormat(loginQuery, userName).ToString());
                if (dbOtpValue == otpValue)
                {
                    string updateQuery = string.Format("UPDATE HR_EMPLOYEE_OTP_DT SET STATUS = 0 WHERE CUSTOMIZEDID = '{0}' AND GENERATED_OTP = '{1}'", userName, dbOtpValue);
                    updatedRows = await connection.ExecuteAsync(updateQuery);
                }
            }
            return updatedRows > 0;
        }
        public async Task<OtpData> SignUp(string userName)
        {
            OtpData otpData = null;
            UserInformation userInformation = null;

            string loginQuery = "SELECT * FROM HR_EMPLOYEE_MT WHERE CUSTOMIZEDID = '{0}' AND STATUS=1 AND ISFIRSTLOGIN = 1";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                string query = string.Format(loginQuery, userName);
                userInformation = await connection.QueryFirstOrDefaultAsync<UserInformation>(query);
            }
            if (userInformation != null)
            {
                otpData = await GetOtp(userName, true);
            }
            return otpData;
        }

        private string GenerateOtp()
        {
            string secretKey = "1234567890123456789012345678901234567890123456789012345678901234";
            Totp otpCalc = new Totp(Encoding.UTF8.GetBytes(secretKey), 30, OtpHashMode.Sha512, 8);
            string otp = otpCalc.ComputeTotp(DateTime.UtcNow);
            return otp;
        }
        private bool ValidateOtp(string otpValue)
        {
            long timeRemaining = 0;
            string secretKey = "1234567890123456789012345678901234567890123456789012345678901234";
            Totp otpCalc = new Totp(Encoding.UTF8.GetBytes(secretKey));
            bool isotpVerified = otpCalc.VerifyTotp(otpValue, out timeRemaining, null);
            return isotpVerified;
        }


        public async Task<bool> ChangePassword(UserInformation userInformation)
        {
            UserInformation dbUserInformation = null;
            int updatedRows = 0;
            bool isPasswordChanged = false;
            string loginQuery = "SELECT * FROM HR_EMPLOYEE_MT WHERE CUSTOMIZEDID = '{0}' AND STATUS =1";
            string updateQuery = "UPDATE HR_EMPLOYEE_MT SET ISFIRSTLOGIN = 0, PASSWORD = '{0}', PASSWORDSALT = '{1}' WHERE CUSTOMIZEDID = '{2}'";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                dbUserInformation = await connection.QueryFirstOrDefaultAsync<UserInformation>(new StringBuilder().AppendFormat(loginQuery, userInformation.CustomizedId).ToString());
            }
            if (dbUserInformation != null)
            {
                string passwordSalt = Guid.NewGuid().ToString().Replace("-", "").ToUpper();
                string password = cryptography.Encrypt(userInformation.Password, passwordSalt);
                string encryptedPassword = cryptography.Encrypt(password, passwordSalt);
                using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
                {
                    updatedRows = await connection.ExecuteAsync(new StringBuilder().AppendFormat(updateQuery, password, passwordSalt, dbUserInformation.CustomizedId).ToString());
                    isPasswordChanged = updatedRows > 0;
                }
            }
            return isPasswordChanged;
        }


        private async Task<EmployeeProfile> GetEmployeeMinimalProfile(int employeeSlno)
        {
            EmployeeProfile employeeProfile = null;
            using (EmployeeInformationRepository profileRepository = new EmployeeInformationRepository(configuration, this.redisCache))
            {
                employeeProfile = await profileRepository.GetEmployeeMinimumProfile(employeeSlno);
            }
            return employeeProfile;
        }

        private async Task<bool> SavelastLogin(long employeeSlno)
        {
            int updatedRows = 0;
            bool isUpdated = false;
            string loginQuery = "UPDATE hr_employee_mt SET lastlogintime = '{0}' WHERE employeeslno = {1}";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                updatedRows = await connection.ExecuteAsync(new StringBuilder().AppendFormat(loginQuery, DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt"), employeeSlno).ToString());
            }
            isUpdated = updatedRows > 0;
            return isUpdated;
        }

        public async Task<UserInformation> AuthenticateUserForEpic(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            string password = string.Empty;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iUSERID", loginInformation.UserName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                userInformation = connection.QueryFirstOrDefault<UserInformation>(DatabaseProcedures.VALIDATE_USER, parameters, commandType: CommandType.StoredProcedure);
            }
            if (userInformation != null)
            {
                string plianText = string.Empty;
                if (!string.IsNullOrEmpty(userInformation.PasswordSalt))
                {
                    password = cryptography.Encrypt(loginInformation.Password, userInformation.PasswordSalt);
                    plianText = cryptography.Decrypt(userInformation.Password, userInformation.PasswordSalt);
                }
                if (userInformation.Password == password)
                {
                    EmployeeProfile profile = await GetEmployeeMinimalProfile(userInformation.EmployeeSlno);
                    userInformation.EmpId = profile.EmpId;
                    userInformation.EmployeeSlno = profile.EmployeeSlno;
                    userInformation.EmployeeId = profile.EmployeeId;
                    userInformation.UserName = userInformation.UserName;
                    userInformation.FirstName = profile.EmployeeName;
                    userInformation.LastName = profile.EmployeeName;
                    userInformation.EmployeeName = profile.EmployeeName;
                    userInformation.Password = string.Empty;
                    userInformation.PasswordSalt = string.Empty;
                }
                else
                {
                    userInformation = null;
                }
            }
            return userInformation;
        }
    }
}
