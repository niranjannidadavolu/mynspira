using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.EmployeeVerification;
using Phoenix.Model.Business.EmployeeVerification.Equal;
using Phoenix.Model.Business.Mandals;

using RestSharp.Authenticators;

using RestSharp;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Microsoft.AspNetCore.Http;
using Phoenix.Model.Business.LeaveManagement;
using System.Reflection.Metadata;
using Phoenix.Model.Business.Administration;
using System.Text;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Extension.System.String;

namespace Phoenix.Database.Repository.EmployeeVerification
{
    public class EmployeeVerificationRespository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public EmployeeVerificationRespository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<Root> GetVerficationResult(string idempotencyId, int? EmployeeSlno = null)
        {
            RestClientOptions options = new RestClientOptions(EqualSettings.Current.EqualGateWayUrl)
            {
                Timeout = -1
            };

            RestClient client = new RestClient(options);
            RestRequest request = new RestRequest(EqualSettings.Current.FetchData, Method.Post);
            client.Authenticator = new HttpBasicAuthenticator(EqualSettings.Current.ClientId, EqualSettings.Current.ClientSecret);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Accept", "application/json");
            string body = string.Format("\"{0}\"", idempotencyId);
            request.AddStringBody(body, DataFormat.Json);
            RestResponse response = await client.ExecuteAsync(request);
            Root verificationResult = JsonConvert.DeserializeObject<Root>(response.Content);
            if(verificationResult.data != null && EmployeeSlno != null)
            {
                verificationResult.AadharPath = await GetEmployeeAadharPath(EmployeeSlno);
            }
            return verificationResult;
        }



        private string GetPanHashCode(PAN panDetails, string idempotencyId, int employeeSlno)
        {
            int result = 1;

            result = (result * 397) ^ employeeSlno.GetHashCode();
            result = (result * 397) ^ idempotencyId.GetHashCode();
            result = (result * 397) ^ panDetails.key_name.GetHashCode();
            result = (result * 397) ^ panDetails.key_status.GetHashCode();
            result = (result * 397) ^ panDetails.key_data[0].gender.GetHashCode();
            result = (result * 397) ^ panDetails.key_data[0].key_id.GetHashCode();
            result = (result * 397) ^ panDetails.key_data[0].dob.GetHashCode();
            result = (result * 397) ^ panDetails.key_data[0].name.GetHashCode();
            result = (result * 397) ^ panDetails.key_data[0].key_fetched_at.GetHashCode();
            return result.ToString();
        }


        private string GetAadharHashCode(AADHAAR aadhardetails, string idempotencyId, int employeeSlno)
        {
            int result = 1;

            result = (result * 397) ^ employeeSlno.GetHashCode();
            result = (result * 397) ^ idempotencyId.GetHashCode();
            result = (result * 397) ^ aadhardetails.key_name.GetHashCode();
            result = (result * 397) ^ aadhardetails.key_status.GetHashCode();
            result = (result * 397) ^ aadhardetails.key_data[0].gender.GetHashCode();
            result = (result * 397) ^ aadhardetails.key_data[0].key_id.GetHashCode();
            result = (result * 397) ^ aadhardetails.key_data[0].dob.GetHashCode();
            result = (result * 397) ^ aadhardetails.key_data[0].name.GetHashCode();
            result = (result * 397) ^ aadhardetails.key_data[0].key_fetched_at.GetHashCode();
            return result.ToString();
        }
        private string GetBankHashCode(BANKACCOUNT bankDetails, string idempotencyId, int employeeSlno)
        {
            int result = 1;

            result = (result * 397) ^ employeeSlno.GetHashCode();
            result = (result * 397) ^ idempotencyId.GetHashCode();
            result = (result * 397) ^ bankDetails.key_name.GetHashCode();
            result = (result * 397) ^ bankDetails.key_status.GetHashCode();
            result = (result * 397) ^ bankDetails.key_data[0].account_number.GetHashCode();
            result = (result * 397) ^ bankDetails.key_data[0].bank_name.GetHashCode();
            result = (result * 397) ^ bankDetails.key_data[0].branch_name.GetHashCode();
            result = (result * 397) ^ bankDetails.key_data[0].ifsc.GetHashCode();
            result = (result * 397) ^ bankDetails.key_data[0].key_fetched_at.GetHashCode();
            return result.ToString();
        }
        public async Task<bool> SaveEmployeeVerifiedData(string idempotencyId, int employeeSlno)
        {
            int panRowsSaved = 0;
            int aadharRowsSaved = 0;
            int bankRowsSaved = 0;
            int isEmployeeUpdated = 0;
            bool isSucess = false;
            Root verificationResult = await GetVerficationResult(idempotencyId);

            if (verificationResult != null && verificationResult.status.ToUpper() == "SUCCESS")
            {
                PAN panDetails = verificationResult.data.key_details.PAN;
                AADHAAR aADHAAR = verificationResult.data.key_details.AADHAAR;
                BANKACCOUNT bankAccount = verificationResult.data.key_details.BANK_ACCOUNT;
                DRIVINGLICENCE drivingLicence = verificationResult.data.key_details.DRIVING_LICENCE;
                //TODO: Save PAN DETAILS
                if (panDetails != null)
                {
                    using (var connection = await base.CreateConnection(DbSchema.PORTAL))
                    {
                        OracleDynamicParameters parameters = new OracleDynamicParameters();
                        parameters.Add(name: "iIDEMPOTENCY_ID", idempotencyId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_NAME", panDetails.key_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_STATUS", panDetails.key_status, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IGENDER", panDetails.key_data[0].gender, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_ID", panDetails.key_data[0].key_id, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IDOB", panDetails.key_data[0].dob, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "INAME", panDetails.key_data[0].name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_REPORT", panDetails.key_data[0].key_report, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_BUID", panDetails.key_data[0].key_buid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_PROVIDER", panDetails.key_data[0].key_provider, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_GLOBAL_UID", panDetails.key_data[0].key_global_uid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_SOURCE", panDetails.key_data[0].key_source, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_FETCHED_AT", panDetails.key_data[0].key_fetched_at, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IHASH_KEY_CODE", GetPanHashCode(panDetails, idempotencyId, employeeSlno), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        panRowsSaved = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_EMPLOYEE_PAN, parameters, commandType: CommandType.StoredProcedure);

                    }
                }
                //TODO: SAVE AADHAR DETAILS
                if (aADHAAR != null)
                {
                    using (var connection = await base.CreateConnection(DbSchema.PORTAL))
                    {
                        OracleDynamicParameters parameters = new OracleDynamicParameters();
                        parameters.Add(name: "iIDEMPOTENCY_ID", idempotencyId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_NAME", aADHAAR.key_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_STATUS", aADHAAR.key_status, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

                        parameters.Add(name: "IADDRESS_AREA", aADHAAR.key_data[0].address_area, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IARTEFACT", aADHAAR.key_data[0].equal_artefact, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS", aADHAAR.key_data[0].address, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IGENDER", aADHAAR.key_data[0].gender, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS_HOUSE", aADHAAR.key_data[0].address_house, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_ID", aADHAAR.key_data[0].key_id, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS_COUNTRY", aADHAAR.key_data[0].address_country, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS_STATE", aADHAAR.key_data[0].address_state, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IPHOTO", aADHAAR.key_data[0].photo, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IVERIFICATION_TYPE", aADHAAR.key_data[0].verification_type, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_PROVIDER", aADHAAR.key_data[0].key_provider, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

                        parameters.Add(name: "ICO", aADHAAR.key_data[0].co, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS_PINCODE", aADHAAR.key_data[0].address_pincode, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IISSUER_NAME", aADHAAR.key_data[0].issuer_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS_LANDMARK", aADHAAR.key_data[0].address_landmark, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IDOB", aADHAAR.key_data[0].dob, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS_STREET", aADHAAR.key_data[0].address_street, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "INAME", aADHAAR.key_data[0].name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_BUID", aADHAAR.key_data[0].key_buid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_GLOBAL_UID", aADHAAR.key_data[0].key_global_uid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_SOURCE", aADHAAR.key_data[0].key_source, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IADDRESS_DISTRICT", aADHAAR.key_data[0].address_district, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IHASH_KEY_CODE", GetAadharHashCode(aADHAAR, idempotencyId, employeeSlno), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_FETCHED_AT", aADHAAR.key_data[0].key_fetched_at, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);


                        aadharRowsSaved = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_EMPLOYEE_AADHAAR, parameters, commandType: CommandType.StoredProcedure);

                    }
                }
                //TODO: BANK DETAILS
                if (bankAccount != null)
                {
                    using (var connection = await base.CreateConnection(DbSchema.PORTAL))
                    {
                        OracleDynamicParameters parameters = new OracleDynamicParameters();
                        parameters.Add(name: "iIDEMPOTENCY_ID", idempotencyId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_STATUS", bankAccount.key_status, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iACCOUNT_NUMBER", bankAccount.key_data[0].account_number, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "IKEY_ID", bankAccount.key_data[0].key_id, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iKEY_PROVIDER", bankAccount.key_data[0].key_provider, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iISSUER_NAME", bankAccount.key_data[0].issuer_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iKEY_NAME", bankAccount.key_data[0].key_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iBRANCH_NAME", bankAccount.key_data[0].branch_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iBANK_NAME", bankAccount.key_data[0].bank_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iNAME", bankAccount.key_data[0].name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iKEY_BUID", bankAccount.key_data[0].key_buid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iKEY_GLOBAL_UID", bankAccount.key_data[0].key_global_uid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iKEY_SOURCE", bankAccount.key_data[0].key_source, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iIFSC", bankAccount.key_data[0].ifsc, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iHASH_KEY_CODE", GetBankHashCode(bankAccount, idempotencyId, employeeSlno), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iKEY_FETCHED_AT", bankAccount.key_data[0].key_fetched_at, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        bankRowsSaved = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_EMPLOYEE_BANK_ACCOUNT, parameters, commandType: CommandType.StoredProcedure);

                    }
                }
                //TODO: DRIVING LICENCE
                if(drivingLicence != null)
                {
                    //using (var connection = await base.CreateConnection(DbSchema.PORTAL))
                    //{
                    //    OracleDynamicParameters parameters = new OracleDynamicParameters();
                    //    parameters.Add(name: "iIDEMPOTENCY_ID", idempotencyId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "IEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "IKEY_STATUS", drivingLicence.key_status, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iNAME", drivingLicence.key_data[0].name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iDL_NUMBER", drivingLicence.key_data[0]., dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iDOB", drivingLicence.key_data[0].key_provider, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iFATHER_HUSBAND_NAME", drivingLicence.key_data[0].issuer_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iADDRESS", drivingLicence.key_data[0].key_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iISSUED_DATE", drivingLicence.key_data[0].branch_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iEXPIRY_DATE", drivingLicence.key_data[0].bank_name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iPERMANENT_ADDRESS", drivingLicence.key_data[0].name, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iKEY_SOURCE", drivingLicence.key_data[0].key_buid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    parameters.Add(name: "iKEY_PROVIDER", drivingLicence.key_data[0].key_global_uid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //    bankRowsSaved = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_EMP_DRIVING_LICENSE, parameters, commandType: CommandType.StoredProcedure);
                    //}
                }

                //TODO: PAYSLIPS
                using (var connection = await base.CreateConnection(DbSchema.PORTAL))
                {
                }

                if ((panRowsSaved * -1) > 0 || (aadharRowsSaved * -1) > 0 || (bankRowsSaved * -1) > 0)
                {
                    //verificationResult.data.key_details.PAN.key_data.
                    using (var connection = await base.CreateConnection(DbSchema.PORTAL))
                    {
                        OracleDynamicParameters parameters = new OracleDynamicParameters();
                        parameters.Add(name: "IEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iIDEMPOTENCYID", idempotencyId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

                        isEmployeeUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_EMP_VERIFY_STATUS, parameters, commandType: CommandType.StoredProcedure);
                    }
                    isSucess = (isEmployeeUpdated * -1) > 0;

                }
            }

            return isSucess;
        }
        public async Task<bool> UpdateEmployeeVerificationStatus(EmployeeVerificationStatusReq req)
        {
            bool resp = false;
            int updatedRecords = 0;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters param = new();
                param.Add(name: "ISTATUSID", req.StatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IEMPLOYEESLNO", req.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iIDEMPOTENCYID", req.IdempotencyId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "IAPPROVED_BY", req.ApprovedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IAPPROVED_REMARKS", req.ApprovedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "ILOCK_BANK_DETAILS", req.LockBankDetails.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_EMP_HR_VERIFY_STATUS, param, commandType: CommandType.StoredProcedure);

                resp = (updatedRecords * -1) > 0;
            }
            return resp;

        }
        public async Task<string> GetEmployeeAadharPath(int? EmployeeSlno)
        {
            string employeeAadharPath = null;
            StringBuilder imagesPath = new StringBuilder();
            string[] imagePath = null;

            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add(name: "IEMPLOYEESLNO", EmployeeSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbScreenInformations = await connection.QueryAsync<string>(DatabaseProcedures.GET_EMP_AADHAR_PATH, parameters, commandType: CommandType.StoredProcedure);
                if (dbScreenInformations != null)
                {
                    employeeAadharPath = dbScreenInformations.FirstOrDefault();
                    imagesPath.Clear();
                    imagePath = employeeAadharPath.Split('/');
                    string path = imagePath.Where(x => !x.IsNotNullOrEmpty()).FirstOrDefault();
                    imagesPath.AppendFormat("{0}/AADHAR/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                    employeeAadharPath = imagesPath.ToString();
                }
            }
            return employeeAadharPath;

        }
    }
}
