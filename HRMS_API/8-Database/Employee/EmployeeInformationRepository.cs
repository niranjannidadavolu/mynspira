using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using OtpNet;

using Phoenix.CrossCutting.Resources;
using Phoenix.CrossCutting.TimePeriod;
using Phoenix.Database.Repository.Attendance;
using Phoenix.Database.Repository.Masters;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.CarLease;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.EmployeeVerification;
using Phoenix.Model.Business.Form16;
using Phoenix.Model.Business.HelpDocuments;
using Phoenix.Model.Business.Masters;
using Phoenix.Model.Business.Payroll;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using RestSharp;

using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.DateTime;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Extension.System.String;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.Infrastructure.BusinessModel;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Employee
{
    public class EmployeeInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public EmployeeInformationRepository(IConfiguration configuration, IDistributedCache redisCache) : base(
            configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<EmployeeProfile> GetEmployeeProfile(int employeeSlno)
        {
            EmployeeProfile employee = null;
            var imagesPath = new StringBuilder();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                parameters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iTARGET", Employee_Details.EMPLOYEE.ToInt32OrDefault(), OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                employee = await connection.QueryFirstAsync<EmployeeProfile>(DatabaseProcedures.GET_EMP_PROFILE_DATA,
                    parameters, commandType: CommandType.StoredProcedure).ConfigureAwait(false);
            }

            if (employee != null)
            {
                imagesPath.Clear();
                var imagePath = employee.PhotoPath.Split('/');
                imagesPath.AppendFormat("{0}/photos/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                employee.PhotoPath = imagesPath.ToString();
                employee.PhotoBinary =
                    $"data:image/gif;base64,{GetBinaryData(imagesPath.ToString())}";

                imagesPath.Clear();
                imagePath = employee.BankInfoPath.Split('/');
                imagesPath.AppendFormat("{0}/BANK/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                employee.BankInfoPath = imagesPath.ToString();

                imagesPath.Clear();
                imagePath = employee.AadharPath.Split('/');
                imagesPath.AppendFormat("{0}/AADHAR/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                employee.AadharPath = imagesPath.ToString();

                employee.FinSLNo = ApplicationSettings.Current.FinancialYearId;
                employee.EmployeeEducationDetails = await GetEmployeeEducationDetails(employeeSlno);
                employee.EmployeeFamilyDetails = await GetEmployeeFamilyDetails(employeeSlno);
                employee.EmployeeExperienceDetails = await GetEmployeeExperienceDetails(employeeSlno);
                employee.EmployeeAddressDetails = await GetEmployeeAddressDetails(employeeSlno);
                employee.EmployeeAssetDetails = await GetEmployeeAssetDetails(employeeSlno);
            }

            return employee;
        }

        private async Task<List<ReportingStructure>> GetEmployeeReportingStructure(int employeeSlno, int officeTypeSlno)
        {
            List<ReportingStructure> reportingStructure = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                var templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iOFFICE_TYPE_SLNO", officeTypeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbScreenInformations = await connection.QueryAsync<ReportingStructure>(
                    DatabaseProcedures.SP_GET_EMP_REPORTING_MANAGERS, parameters,
                    commandType: CommandType.StoredProcedure);
                reportingStructure = dbScreenInformations.ToList();
            }

            return reportingStructure;
        }

        public async Task<List<HolidayInformation>> GetEmployeeHolidays(long employeeId)
        {
            List<HolidayInformation> holidays = null;
            using (var repository = new HolidayRepository(configuration, redisCache))
            {
                holidays = await repository.GetEmployeeHolidays(employeeId);
                foreach (var item in holidays)
                {
                    item.MonthName = item.HolidayDate.ToString("MMM");
                    item.Day = item.HolidayDate.ToString("dd");
                }

                holidays = holidays.OrderBy(i => i.HolidayDate).ToList(); // .Take(3)
            }

            return holidays;
        }

        public async Task<EmployeeProfile> GetEmployeeMinimumProfile(int employeeSlno)
        {
            EmployeeProfile employee = null;
            var imagesPath = new StringBuilder();
            var flag = await GetEmployeeEligibleForLeave(employeeSlno);


            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("iTARGET", Employee_Details.EMPLOYEE.ToInt32OrDefault(), OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                employee = await connection.QueryFirstAsync<EmployeeProfile>(DatabaseProcedures.GET_EMP_PROFILE_DATA,
                    parmeters, commandType: CommandType.StoredProcedure);
            }

            if (employee != null)
            {
                employee.AllowProofUpload = ApplicationSettings.Current.AllowProofUpload;
                employee.AllowVerfication = ApplicationSettings.Current.AllowVerfication;

                imagesPath.Clear();
                var imagePath = employee.PhotoPath.Split('/');
                imagesPath.AppendFormat("{0}/photos/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                employee.PhotoPath = imagesPath.ToString();

                imagesPath.Clear();
                imagePath = employee.BankInfoPath.Split('/');
                imagesPath.AppendFormat("{0}/BANK/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                employee.BankInfoPath = imagesPath.ToString();

                imagesPath.Clear();
                imagesPath.Clear();
                imagePath = employee.AadharPath.Split('/');
                imagesPath.AppendFormat("{0}/AADHAR/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                employee.AadharPath = imagesPath.ToString();

                employee.FinSLNo = ApplicationSettings.Current.FinancialYearId;
                var payrollPeriod = await GetPayrollDates(DateTime.Now);
                employee.PayrollMonthFrom = payrollPeriod.FromDate;
                employee.PayrollMonthTo = payrollPeriod.ToDate;
                employee.ReportingStructure =
                    await GetEmployeeReportingStructure(employeeSlno, employee.OfficeTypeSlno);
                if (employee.ReportingStructure != null && employee.ReportingStructure.Count > 0)
                {
                    employee.LevelCount = employee.ReportingStructure[0].LevelCount;
                    employee.ReportingManagerId = employee.ReportingStructure[0].ReportingEmployeeSlno;
                    employee.ReportingManagerName = employee.ReportingStructure[0].ReportingEmployeeName;

                    var inValidReportingEmployees = employee.ReportingStructure.Where(x => x.ReportingEmployeeSlno == 0)
                        .ToList().Count;

                    employee.CanApplyLeave = inValidReportingEmployees == 0;
                }

                employee.HrDetails = await GetEmployeeHRDetails(employeeSlno);
                employee.IsApplicable = flag;
            }

            return employee;
        }

        private async Task<PayrollPeriod> GetPayrollDates(DateTime fromDate)
        {
            PayrollPeriod payrollPeriod = null;
            using (var connection = new PayrollPeriodRepository(configuration))
            {
                payrollPeriod = await connection.GetPayrollDates(fromDate);
            }

            return payrollPeriod;
        }

        public async Task<EmployeeProfile> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfile employee = null;
            var imagesPath = new StringBuilder();
            string[] imagePath = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("IEMPLOYEEID", employeeId, OracleMappingType.Varchar2, ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                employee = await connection.QueryFirstAsync<EmployeeProfile>(DatabaseProcedures.SP_GET_EMPLOYEE_PROFILE,
                    parmeters, commandType: CommandType.StoredProcedure);
            }

            if (employee != null)
                //imagesPath.Clear();
                //imagePath = employee.PhotoPath.Split('/');
                //imagesPath.AppendFormat("{0}/photos/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                //employee.PhotoPath = imagesPath.ToString();
                ////employee.PhotoBinary = string.Format("{0},{1}", "data:image/gif;base64", GetBinaryData(imagesPath.ToString()));
                //imagesPath.Clear();
                //imagePath = employee.BankInfoPath.Split('/');
                //imagesPath.AppendFormat("{0}/BANK/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                //employee.BankInfoPath = imagesPath.ToString();
                ////employee.BankBinary = string.Format("{0},{1}", "data:image/jpg;base64", GetBinaryData(imagesPath.ToString()));
                //imagesPath.Clear(); imagesPath.Clear();
                //imagePath = employee.AadharPath.Split('/');
                //imagesPath.AppendFormat("{0}/AADHAR/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                //employee.AadharPath = imagesPath.ToString();
                employee.FinSLNo = ApplicationSettings.Current.FinancialYearId;
            return employee;
        }

        private async Task<EmployeeProfile> GetEmployeeHRDetails(int employeeSlno)
        {
            EmployeeProfile hrInfo = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                var templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                hrInfo = await connection.QueryFirstOrDefaultAsync<EmployeeProfile>(
                    DatabaseProcedures.SP_GET_EMPLOYEE_HR_DETAILS, parameters,
                    commandType: CommandType.StoredProcedure);
            }

            return hrInfo;
        }

        //Added by Sudeer -- Check employee is Eligible for leave apply.
        public async Task<bool> GetEmployeeEligibleForLeave(int employeeSlno)
        {
            var isEligible = false;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var employeeWF = (await connection.QueryAsync<WorkFlowFlag>(DatabaseProcedures.GET_EMPLOYEE_LEVELS,
                    parmeters, commandType: CommandType.StoredProcedure)).ToList();
                if (employeeWF.Count > 0)
                {
                    if (employeeWF.Count == employeeWF[0].EmpstepsCount)
                        isEligible = true;
                    else
                        isEligible = false;
                }
                else
                {
                    isEligible = false;
                }
            }

            return isEligible;
        }


        private string GetBinaryData(string url)
        {
            var encodedFileAsBase64 = string.Empty;
            var encodedUrl = Convert.ToBase64String(Encoding.Default.GetBytes(url));
            try
            {
                using (var client = new WebClient())
                {
                    var dataBytes = client.DownloadData(new Uri(url));
                    encodedFileAsBase64 = Convert.ToBase64String(dataBytes);
                }
            }
            catch (Exception ex)
            {
                encodedFileAsBase64 = GetNoPhotoData(ApplicationSettings.Current.NoPhoto);
            }

            return encodedFileAsBase64;
        }

        private string GetNoPhotoData(string url)
        {
            var encodedFileAsBase64 = string.Empty;
            var encodedUrl = Convert.ToBase64String(Encoding.Default.GetBytes(url));
            try
            {
                using (var client = new WebClient())
                {
                    var dataBytes = client.DownloadData(new Uri(url));
                    encodedFileAsBase64 = Convert.ToBase64String(dataBytes);
                }
            }
            catch (Exception ex)
            {
                encodedFileAsBase64 = string.Empty;
            }

            return encodedFileAsBase64;
        }

        private string GetBinaryData(string url, string fileType)
        {
            var encodedFileAsBase64 = string.Empty;
            var client = new RestClient();
            var request = new RestRequest(url);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("authorization", "Basic YLKHSouHSSUGh2");
            RestResponse handle = client.ExecuteAsync<RestResponse>(request).Result;
            encodedFileAsBase64 = string.Format("data:image/{0};base64, {1}", fileType,
                Convert.ToBase64String(handle.RawBytes));
            //return "data:image/png;base64," + Convert.ToBase64String(handle.RawBytes);
            return encodedFileAsBase64;
        }

        private async Task<List<EducationDetail>> GetEmployeeEducationDetails(int employeeSlno)
        {
            List<EducationDetail> educationDetails = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("iTARGET", Employee_Details.EDUCATIONDTLS.ToInt32OrDefault(), OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                educationDetails = (await connection.QueryAsync<EducationDetail>(
                        DatabaseProcedures.GET_EMP_PROFILE_DATA, parmeters, commandType: CommandType.StoredProcedure))
                    .ToList();
            }

            return educationDetails;
        }

        public async Task<List<FamilyDetail>> GetEmployeeFamilyDetails(int employeeSlno)
        {
            List<FamilyDetail> familyDetails = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("iTARGET", Employee_Details.FAMILYDTLS.ToInt32OrDefault(), OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                familyDetails = (await connection.QueryAsync<FamilyDetail>(DatabaseProcedures.GET_EMP_PROFILE_DATA,
                    parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return familyDetails;
        }

        public async Task<List<ExperienceDetail>> GetEmployeeExperienceDetails(int employeeSlno)
        {
            List<ExperienceDetail> experienceDetails = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("iTARGET", Employee_Details.EXPERIENACEDTLS.ToInt32OrDefault(),
                    OracleMappingType.Varchar2, ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                experienceDetails = (await connection.QueryAsync<ExperienceDetail>(
                        DatabaseProcedures.GET_EMP_PROFILE_DATA, parmeters, commandType: CommandType.StoredProcedure))
                    .ToList();
            }

            return experienceDetails;
        }

        public async Task<List<AddressDetail>> GetEmployeeAddressDetails(int employeeSlno)
        {
            var addressDetails = new List<AddressDetail>();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("iTARGET", Employee_Details.ADDRESSDTLS.ToInt32OrDefault(), OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                addressDetails = (await connection.QueryAsync<AddressDetail>(DatabaseProcedures.GET_EMP_PROFILE_DATA,
                    parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return addressDetails;
        }

        public async Task<List<AssetDetail>> GetEmployeeAssetDetails(int employeeSlno)
        {
            List<AssetDetail> assetDetails = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEMPLOYEESLNO", employeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("iTARGET", Employee_Details.ASSET.ToInt32OrDefault(), OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                assetDetails = (await connection.QueryAsync<AssetDetail>(DatabaseProcedures.GET_EMP_PROFILE_DATA,
                    parmeters, commandType: CommandType.StoredProcedure)).ToList();
                ////ssetDetails = (await connection.QueryAsync<AssetDetail>("SELECT ROWNUM SLNO, E.EMPID,"
                //    + "E.EMPLOYEESLNO, E.NAME EMPLOYEENAME, ASM.NAME ASSETNAME, ASD.QTY, ASD.AMT AMOUNT, ASD.CONFIGURATION, DECODE(ASD.STATUS, 1, 'ACTIVE', 2, 'RETURNED') ASSETSTATUS FROM(SELECT * "
                //    + " FROM PAYROLLNEW.P_EMP_DT WHERE STATUS = 1 AND EMPLOYEESLNO = 23006) E, PAYROLLNEW.P_EMPLOYEE_MT HREMP, PAYROLLNEW.P_ASSET_MT ASM, PAYROLLNEW.P_ASSET_ISSUED_TO_EMP_DT ASD "
                //    + "WHERE E.STATUS IN(1, 3) AND E.UNIQUENO = ASD.UNIQUENO and E.EMPLOYEESLNO = HREMP.EMPLOYEESLNO AND ASM.PASSETSLNO = ASD.PASSETSLNO", commandType: CommandType.Text)).ToList();
            }

            return assetDetails;
        }

        public async Task<PagedResultSet<EmployeeProfile>> SearchEmployeeInformations(
            EmployeeInformationSearchCriteria searchCriteria)
        {
            List<EmployeeProfile> mappedScreens = null;
            var totalRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                var templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add("iSEARCH_TERM", searchCriteria.SearchValue, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iSTART_INDEX", searchCriteria.StartIndex, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iEND_INDEX", searchCriteria.EndIndex, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("oTOTAL_RECORDS", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbScreenInformations = await connection.QueryAsync<EmployeeProfile>(
                    DatabaseProcedures.P_SEARCH_EMPLOYEE_PORTAL, parameters, commandType: CommandType.StoredProcedure);
                totalRecords = parameters.Get<int>("@oTOTAL_RECORDS").ToInt32OrDefault();
                mappedScreens = dbScreenInformations.ToList();
            }

            var menuItems = new PagedResultSet<EmployeeProfile>
            {
                Items = mappedScreens,
                PageIndex = searchCriteria.StartIndex,
                PageSize = searchCriteria.EndIndex,
                TotalItems = totalRecords
            };
            //menuItems = GetMenuItems(mappedScreens);
            return menuItems;
        }

        public async Task<List<BloodRelation>> GetFamilyBloodRelationDetails()
        {
            var familyBloodRelations = new List<BloodRelation>();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                familyBloodRelations = (await connection.QueryAsync<BloodRelation>(
                        DatabaseProcedures.SP_M_BLOODRELATION_MT, parmeters, commandType: CommandType.StoredProcedure))
                    .ToList();
            }

            return familyBloodRelations;
        }

        public async Task<List<Education>> GetEducationDetails()
        {
            var educationDetails = new List<Education>();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                educationDetails = (await connection.QueryAsync<Education>(DatabaseProcedures.SP_M_EDUCATION_MT,
                    parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return educationDetails;
        }

        public async Task<List<Education>> GetEducationCourseDetails()
        {
            var courseDetails = new List<Education>();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                courseDetails = (await connection.QueryAsync<Education>(DatabaseProcedures.SP_EDUCATION_COURCE_MT,
                    parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return courseDetails;
        }

        public async Task<List<BloodGroup>> GetBloodGroup()
        {
            var bloodGroup = new List<BloodGroup>();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                bloodGroup = (await connection.QueryAsync<BloodGroup>(DatabaseProcedures.SP_EMP_BLOOD_GROUP_MT,
                    parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return bloodGroup;
        }


        public async Task<List<AdditionalQualification>> GetAdditionalQualification()
        {
            var additionalQualification = new List<AdditionalQualification>();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                additionalQualification =
                    (await connection.QueryAsync<AdditionalQualification>(DatabaseProcedures.SP_GET_ADDQUALIFICATION_MT,
                        parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return additionalQualification;
        }

        public async Task<List<Courses>> CourseFilter(int slno)
        {
            var courses = new List<Courses>();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parmeters = new OracleDynamicParameters();
                parmeters.Add("iEDUCATIONSLNO", slno, OracleMappingType.Int32, ParameterDirection.Input);
                parmeters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                courses = (await connection.QueryAsync<Courses>(DatabaseProcedures.SP_FILTEREDUCOURSE_MT, parmeters,
                    commandType: CommandType.StoredProcedure)).ToList();
            }

            return courses;
        }

        public async Task<bool> GetUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            OtpData otpData = null;
            var otpValue = string.Empty;
            var otpMessage = string.Empty;
            //int updatedRecords = 0;
            var EmailsavedRecords = 0;
            var Subject = ApplicationSettings.Current.OTPMailSubject;

            var email = updadteEmployeeEmail.PersonalEmail.IsNullOrEmpty()
                ? updadteEmployeeEmail.WorkEmail
                : updadteEmployeeEmail.PersonalEmail;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                using (var tran = connection.BeginTransaction())
                {
                    var parameters = new OracleDynamicParameters();

                    otpValue = GenerateOtp();
                    var OTPMessage = ApplicationSettings.Current.OTPMessage;
                    otpMessage = string.Format(OTPMessage, Environment.NewLine, otpValue,
                        ApplicationSettings.Current.OtpTimeOut, Environment.NewLine);
                    var message = string.Format(otpMessage, email, otpValue);
                    var templateid = ApplicationSettings.Current.OTPMailTemplateId;

                    parameters.Add("iEMPLOYEESLNO", updadteEmployeeEmail.EmployeeSlno, OracleMappingType.Int32,
                        ParameterDirection.Input);
                    parameters.Add("iFROM_EMAIL_ADDRESS", MailSettings.Current.FromEmail, OracleMappingType.Varchar2,
                        ParameterDirection.Input);
                    parameters.Add("iTO_EMAIL_ADDRESS", email, OracleMappingType.Varchar2, ParameterDirection.Input);
                    parameters.Add("iSUBJECT", Subject, OracleMappingType.Varchar2, ParameterDirection.Input);
                    parameters.Add("iMESSAGE", message, OracleMappingType.Varchar2, ParameterDirection.Input);
                    parameters.Add("iTEMPLATEID", templateid, OracleMappingType.Varchar2, ParameterDirection.Input);
                    parameters.Add("iGENERATEDOTP", otpValue, OracleMappingType.Varchar2, ParameterDirection.Input);
                    EmailsavedRecords = await connection.ExecuteAsync(DatabaseProcedures.SEND_OTP_EMAIL, parameters,
                        commandType: CommandType.StoredProcedure);
                    tran.Commit();
                }
            }

            var resp = EmailsavedRecords * -1 > 0;
            return resp;
        }

        public async Task<bool> VerifyUpdateEmployeeEmailAddressOtp(UpdadteEmployeeEmail updadteEmployeeEmail)
        {
            var updatedRecords = 0;

            var email = updadteEmployeeEmail.PersonalEmail.IsNullOrEmpty()
                ? updadteEmployeeEmail.WorkEmail
                : updadteEmployeeEmail.PersonalEmail;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                parameters.Add("iGENERATEDOTP", updadteEmployeeEmail.GeneratedOtp, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iEMAIL_ADDRESS", email, OracleMappingType.Varchar2, ParameterDirection.Input);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var verificationDetails = (await connection.QueryAsync<EmailOtpVerification>(DatabaseProcedures.SP_GET_EMAILOTP_VERIFICATION,
                    parameters, commandType: CommandType.StoredProcedure)).FirstOrDefault();
                if (verificationDetails != null &&
                    verificationDetails.GeneratedOtp == updadteEmployeeEmail.GeneratedOtp)
                {
                    var d1 = verificationDetails.GeneratedDate;
                    var d2 = d1.AddMinutes(ApplicationSettings.Current.OtpTimeOut);
                    var result = DateTime.Compare(d2, DateTime.Now);
                    if (result >= 0)
                        using (var tran = connection.BeginTransaction())
                        {
                            var emailparameters = new OracleDynamicParameters();
                            emailparameters.Add("iEMPLOYEESLNO", updadteEmployeeEmail.EmployeeSlno,
                                OracleMappingType.Int32, ParameterDirection.Input);
                            emailparameters.Add("iEMAIL", updadteEmployeeEmail.PersonalEmail,
                                OracleMappingType.Varchar2, ParameterDirection.Input);
                            emailparameters.Add("iOFF_EMAIL", updadteEmployeeEmail.WorkEmail,
                                OracleMappingType.Varchar2, ParameterDirection.Input);
                            updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_POR_UPDATE_EMAIL,
                                emailparameters, commandType: CommandType.StoredProcedure);
                            tran.Commit();
                        }
                }
            }

            var resp = updatedRecords * -1 > 0;
            return resp;
        }

        private string GenerateOtp()
        {
            var secretKey = "1234567890123456789012345678901234567890123456789012345678901234";
            var otpCalc = new Totp(Encoding.UTF8.GetBytes(secretKey), 30, OtpHashMode.Sha512, 8);
            var otp = otpCalc.ComputeTotp(DateTime.UtcNow);
            return otp;
        }

        public async Task<bool> UpdateEmployeePanDetails(UpdadteEmployeePan employeePan)
        {
            var resp = false;
            var recordsUpdated = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var filsUploadStatus = await UploadItrFileToDirectory(employeePan);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add("iEMPLOYEESLNO", employeePan.EmployeeSlno, OracleMappingType.Int32,
                        ParameterDirection.Input);
                    param.Add("iPANNUMBER", employeePan.PanNumber, OracleMappingType.Varchar2,
                        ParameterDirection.Input);
                    param.Add("iFILENAME", employeePan.FileName, OracleMappingType.Varchar2, ParameterDirection.Input);
                    param.Add("iFILENAMEORIGINAL", employeePan.FileName_Original, OracleMappingType.Varchar2,
                        ParameterDirection.Input);
                    param.Add("iFILEPATH", employeePan.FilePath, OracleMappingType.Varchar2, ParameterDirection.Input);
                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_PAN_EMP_FILEUPLOAD, param,
                        commandType: CommandType.StoredProcedure);
                }

                resp = recordsUpdated * -1 > 0;
            }

            return resp;
        }

        private async Task<bool> UploadItrFileToDirectory(UpdadteEmployeePan employeePan)
        {
            if (employeePan != null)
            {
                var filePath = Path.Combine(ApplicationSettings.Current.PanUploadDetailsPath);
                if (!Directory.Exists(filePath)) Directory.CreateDirectory(filePath);
                var fileType = Path.GetExtension(employeePan.FileToUpload.FileName).ToLower();
                var fileName = string.Format("{0}_{1}{2}", employeePan.PanNumber, DateTime.Now.Ticks, fileType);
                filePath = Path.Combine(filePath, fileName);

                if (!File.Exists(filePath))
                {
                    var base64String =
                        employeePan.FileToUpload.FileAsBase64.Substring(
                            employeePan.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                    var imageBytes = Convert.FromBase64String(base64String);
                    File.WriteAllBytes(filePath, imageBytes);
                    employeePan.FilePath = filePath;
                    employeePan.FileName = fileName;
                }
            }

            return true;
        }

        public async Task<bool> UpdateEmployeePanStatus(UpdateEmployeePanStatus req)
        {
            var resp = false;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters param = new();
                param.Add("IPANID", req.PanId, OracleMappingType.Int32, ParameterDirection.Input);
                param.Add("ISTATUSID", req.StatusId, OracleMappingType.Int32, ParameterDirection.Input);
                param.Add("IEMPLOYEESLNO", req.EmployeeSlno, OracleMappingType.Int32, ParameterDirection.Input);
                param.Add("IAPPROVED_BY", req.ApprovedBy, OracleMappingType.Int32, ParameterDirection.Input);
                param.Add("IAPPROVED_REMARKS", req.ApprovedRemarks, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                var updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_EMP_PAN_STATUS, param,
                    commandType: CommandType.StoredProcedure);

                resp = updatedRecords * -1 > 0;
            }

            return resp;
        }

        public async Task<bool> UpdateEmployeeFamilyDetails(FamilyDetail familyDetails)
        {
            var updatedRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                var age = 0;
                parameters.Add("iEMPFAMSLNO", familyDetails.EmpFamSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iEMPSLNO", familyDetails.EmployeeSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iUNIQUENO", familyDetails.Uniqueno, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iBRELSLNO", familyDetails.BrelSlno, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iNAME", familyDetails.RelationName, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iAGE", age, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iISDEPENDENT", 0, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iDESCRIPTION", familyDetails.Description, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iUSERSLNO", familyDetails.Userslno, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iIPADDRESS", "", OracleMappingType.Varchar2, ParameterDirection.Input);
                parameters.Add("iDOB",
                    familyDetails.RelationDOB != null ? familyDetails.RelationDOB.Value.ToOracleDate() : null,
                    OracleMappingType.Date, ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_FAMILYDETAILS, parameters,
                    commandType: CommandType.StoredProcedure);
            }

            var resp = updatedRecords * -1 > 0;
            return resp;
        }

        public async Task<bool> UpdateEmployeeEducationDetails(EducationDetail educationDetail)
        {
            var updatedRecords = 0;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();

                parameters.Add("iEMPEDUSLNO", educationDetail.Empeduslno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iEMPSLNO", educationDetail.EmployeeSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iUNIQUENO", educationDetail.Uniqueno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iEDUCATIONSLNO", educationDetail.EducationSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iEDUCOURSESLNO", educationDetail.EducourseSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iADDQUASLNO", educationDetail.Addquaslno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iHTNO", educationDetail.HtNo, OracleMappingType.Varchar2, ParameterDirection.Input);
                parameters.Add("iSPECIALIZATION", educationDetail.Specialization, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iCOLLEGENAME", educationDetail.CollegeName, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iUNIVERSITYBOARD", educationDetail.UniversityBoard, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iUNIVERSITYBOARDNAME", educationDetail.UniversityBoardName, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iYEAROFPASSING", educationDetail.YearOfPassing, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iPERCENTANGE", educationDetail.Percentage, OracleMappingType.Decimal,
                    ParameterDirection.Input);
                parameters.Add("iMARKSOBTAINED", educationDetail.Marksobtained, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iREASONFORGAP", educationDetail.Reasonforgap, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iEXTRAACTIVITIES", educationDetail.ExtraActivities, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iUSERSLNO", educationDetail.UserSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iIPADDRESS", "202.133.58.66", OracleMappingType.Varchar2, ParameterDirection.Input);

                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_EDUCATIONDETAILS,
                    parameters, commandType: CommandType.StoredProcedure);
            }

            var resp = updatedRecords * -1 > 0;
            return resp;
        }

        public async Task<bool> UpdateEmployeeExperienceDetails(ExperienceDetail experienceDetail)
        {
            var updatedRecords = 0;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                //experienceDetail.IsNarayanaEmp = experienceDetail.IsNarayanaEmp.ToLower() == "yes" ? "1" : "0";              
                var parameters = new OracleDynamicParameters();

                parameters.Add("iOLDEMPNO", experienceDetail.Oldempno, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iPLACE", experienceDetail.Place, OracleMappingType.Varchar2, ParameterDirection.Input);
                parameters.Add("iREFNAME", experienceDetail.RefName, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iREFPHONENO", experienceDetail.Refphoneno, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iREFEMAIL", experienceDetail.Refemail, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iDESCRIPTION", experienceDetail.Description, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iIPADDRESS", "", OracleMappingType.Varchar2, ParameterDirection.Input);
                parameters.Add("iUNIQUENO", experienceDetail.Uniqueno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iSALARY", experienceDetail.Salary, OracleMappingType.Int32, ParameterDirection.Input);
                parameters.Add("iSALARYUNIT", experienceDetail.SalaryUnit, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iREFMOBILENO", experienceDetail.Refmobileno, OracleMappingType.Int64,
                    ParameterDirection.Input);
                parameters.Add("iUSERSLNO", experienceDetail.Userslno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iEMPEXSLNO", experienceDetail.EmpExSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iEMPSLNO", experienceDetail.EmployeeSlno, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iORGANISATION", experienceDetail.Organisation, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iDESIGNATION", experienceDetail.Designation, OracleMappingType.Varchar2,
                    ParameterDirection.Input);
                parameters.Add("iFROMDATE",
                    experienceDetail.FromDate != null ? experienceDetail.FromDate.Value.ToOracleDate() : null,
                    OracleMappingType.Date, ParameterDirection.Input);
                parameters.Add("iTODATE",
                    experienceDetail.ToDate != null ? experienceDetail.ToDate.Value.ToOracleDate() : null,
                    OracleMappingType.Date, ParameterDirection.Input);
                parameters.Add("iISNARAYANAEMP", experienceDetail.IsNarayanaEmp, OracleMappingType.Int32,
                    ParameterDirection.Input);

                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_EXPERIENCEDETAILS,
                    parameters, commandType: CommandType.StoredProcedure);
            }

            var resp = updatedRecords * -1 > 0;
            return resp;
        }


        public async Task<bool> DeleteEmployeeFamilyDetails(int empFamSlno)
        {
            var deletedRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();

                parameters.Add("iEMPFAMSLNO", empFamSlno, OracleMappingType.Int32, ParameterDirection.Input);
                deletedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_EMPFAMILY_DT, parameters,
                    commandType: CommandType.StoredProcedure);
            }

            var resp = deletedRecords * -1 > 0;
            return resp;
        }

        public async Task<bool> DeleteEmployeeEducationDetails(int empEduSlno)
        {
            var deletedRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();

                parameters.Add("iEMPEDUSLNO", empEduSlno, OracleMappingType.Int32, ParameterDirection.Input);
                deletedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_EMPEDUCATION_DT, parameters,
                    commandType: CommandType.StoredProcedure);
            }

            var resp = deletedRecords * -1 > 0;
            return resp;
        }

        public async Task<bool> DeleteEmployeeExperienceDetails(int empExSlno)
        {
            var deletedRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();

                parameters.Add("iEMPEXSLNO", empExSlno, OracleMappingType.Int32, ParameterDirection.Input);
                deletedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_EMPEXPERIENCE_DT,
                    parameters, commandType: CommandType.StoredProcedure);
            }

            var resp = deletedRecords * -1 > 0;
            return resp;
        }

        public async Task<PagedResultSet<EmployeeProfile>> GetMyTeamMembers(
            EmployeeInformationSearchCriteria searchCriteria)
        {
            List<EmployeeProfile> mappedScreens = null;
            var totalRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                var templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add("iMANAGER_ID", searchCriteria.ManagerId, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("IINCLUDE_SELF", searchCriteria.IncludeSelf, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("oTOTAL_RECORDS", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbScreenInformations = await connection.QueryAsync<EmployeeProfile>(
                    DatabaseProcedures.SP_GET_TEAM_MEMBERS, parameters, commandType: CommandType.StoredProcedure);
                totalRecords = parameters.Get<int>("@oTOTAL_RECORDS").ToInt32OrDefault();
                mappedScreens = dbScreenInformations.ToList();
            }

            var menuItems = new PagedResultSet<EmployeeProfile>
            {
                Items = mappedScreens,
                PageIndex = searchCriteria.StartIndex,
                PageSize = searchCriteria.EndIndex,
                TotalItems = totalRecords
            };
            //menuItems = GetMenuItems(mappedScreens);
            return menuItems;
        }

        public async Task<List<AppointmentLetter>> GetPendingAppointmentLetter()
        {
            List<AppointmentLetter> appointmentLetters = null;
            IEnumerable<AppointmentLetter> pendingAppointmentLetters = null;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                var templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                pendingAppointmentLetters = await connection.QueryAsync<AppointmentLetter>(
                    DatabaseProcedures.GET_APPOINTMENT_LETTERS, parameters, commandType: CommandType.StoredProcedure);
            }

            if (pendingAppointmentLetters != null)
                appointmentLetters = pendingAppointmentLetters.ToList();
            else
                appointmentLetters = new List<AppointmentLetter>();
            //appointmentLetters = new List<AppointmentLetter>();

            //AppointmentLetter app = new AppointmentLetter
            //{
            //    AppointmentDate = DateTime.Now,
            //    Designation = "Program Manager",
            //    EffectiveFromDate = DateTime.Now,
            //    EmployeeId = "5008-01803",
            //    EmployeeName = "Seshu Kumar RSR",
            //    EmployeeNumber = "1",
            //    EmployeeSlno = 500801802,
            //    EmpSlno = 500801802,
            //    GrossSalary = 3600000,
            //    LegalBranchName = "NSPIRA",
            //    LetterId = "NSP7003007",
            //    MonthBasic = 100,
            //    MonthDa = 100,
            //    MonthEESI = 100,
            //    MonthEPF = 100,
            //    MonthHra = 100,
            //    MonthOtherA = 200,
            //    MonthTotal = 300000,
            //    YearBasic = 100,
            //    YearDa = 100,
            //    YearEESI = 100,
            //    YearEPF = 100,
            //    YearHra = 100,
            //    YearOtherA = 200,
            //    YearTotal = 300000,
            //    LegalBranchSlno = 100
            //};

            //AppointmentLetter app1 = new AppointmentLetter
            //{
            //    AppointmentDate = DateTime.Now,
            //    Designation = "Program Manager",
            //    EffectiveFromDate = DateTime.Now,
            //    EmployeeId = "5008-01802",
            //    EmployeeName = "Seshu Kumar RSR",
            //    EmployeeNumber = "NSP7003007",
            //    EmployeeSlno = 500801802,
            //    EmpSlno = 500801802,
            //    GrossSalary = 3600000,
            //    LegalBranchName = "NSPIRA",
            //    LetterId = "NSP7003006",
            //    MonthBasic = 100,
            //    MonthDa = 100,
            //    MonthEESI = 100,
            //    MonthEPF = 100,
            //    MonthHra = 100,
            //    MonthOtherA = 200,
            //    MonthTotal = 300000,
            //    YearBasic = 100,
            //    YearDa = 100,
            //    YearEESI = 100,
            //    YearEPF = 100,
            //    YearHra = 100,
            //    YearOtherA = 200,
            //    YearTotal = 300000,
            //    LegalBranchSlno = 100
            //};

            //appointmentLetters.Add(app);
            //appointmentLetters.Add(app1);

            return appointmentLetters;
        }

        public async Task UpdateAppointmentLetterStatus(int employeeNumber)
        {
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                var templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add("iEMPLOYEESLNO", employeeNumber, OracleMappingType.Int32, ParameterDirection.Input);
                await connection.ExecuteAsync(DatabaseProcedures.UPDATE_APPT_LETTER_STATUS, parameters,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<List<EmployeeProfile>> SearchEmployee(string searchValue)
        {
            List<EmployeeProfile> employeeProfiles = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                parameters.Add("iVAL1", searchValue, OracleMappingType.Varchar2, ParameterDirection.Input);
                parameters.Add("DATACUR", null, OracleMappingType.RefCursor, ParameterDirection.Output);

                var dbEmployees = await connection.QueryAsync<EmployeeProfile>(DatabaseProcedures.P_GETEMPDATA_FOR_API,
                    parameters, commandType: CommandType.StoredProcedure);
                employeeProfiles = dbEmployees.ToList();
            }

            return employeeProfiles;
        }

        public async Task<List<EmployeeReportingStructure>> GetEmployeeReportingStructure(
            EmployeeReportingSearchCriteria searchCriteria)
        {
            List<EmployeeReportingStructure> reportingStructures = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                parameters.Add("iBRANCHSLNO", searchCriteria.Branches.ToArray(), OracleMappingType.Int32,
                    ParameterDirection.Input, searchCriteria.Branches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                reportingStructures = (await connection.QueryAsync<EmployeeReportingStructure>(
                    DatabaseProcedures.SP_EMPLOYEE_REORTING_STRUCTURE, parameters,
                    commandType: CommandType.StoredProcedure)).ToList();
            }

            return reportingStructures;
        }

        public async Task<List<EmployeeProfile>> GetEmployeesByDesignation(List<int> designations)
        {
            List<EmployeeProfile> mappedScreens = null;
            var totalRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                parameters.Add(name: "iDISIGNATIONSLNO", designations.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, designations.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);

                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbEsmployeeInformations = await connection.QueryAsync<EmployeeProfile>(
                    DatabaseProcedures.SP_GET_EMPLOYEE_BY_DESIGNATION, parameters, commandType: CommandType.StoredProcedure);
                mappedScreens = dbEsmployeeInformations.ToList();
            }

            //var menuItems = new PagedResultSet<EmployeeProfile>
            //{
            //    Items = mappedScreens,
            //    PageIndex = searchCriteria.StartIndex,
            //    PageSize = searchCriteria.EndIndex,
            //    TotalItems = totalRecords
            //};
            //menuItems = GetMenuItems(mappedScreens);
            return mappedScreens;
        }

        public async Task<List<EmployeeDetail>> GetEmployees(int departmentId, int designationId)
        {
            List<EmployeeDetail> employeeProfiles = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();


                parameters.Add("iDEPARTMENTSLNO", departmentId, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("iDESIGNATIONSLNO", designationId, OracleMappingType.Int32,
                    ParameterDirection.Input);
                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                employeeProfiles = (await connection.QueryAsync<EmployeeDetail>(PerformanceManagement.SP_GET_ALL_EMPLOYEES, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return employeeProfiles;
        }

        public async Task<List<EmployeeProfile>> GetEmployeesByBranch(List<int> selectedBranches)
        {
            List<EmployeeProfile> employeeProfiles = null;
            var totalRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                var parameters = new OracleDynamicParameters();
                parameters.Add(name: "iBRANCHES", selectedBranches.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, selectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);

                parameters.Add("DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbEsmployeeInformations = await connection.QueryAsync<EmployeeProfile>(CrossCutting.Resources.Employee.SP_GET_EMPLOYEES_BY_BRANCH, parameters, commandType: CommandType.StoredProcedure);
                employeeProfiles = dbEsmployeeInformations.ToList();
            }

            return employeeProfiles;
        }
    }

}