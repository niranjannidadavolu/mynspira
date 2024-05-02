using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Reimbursement;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Database.Repository.Reimbursement
{
    public class ReimbursementRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public ReimbursementRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<ApprovedReimbursement>> GetApprovedBills(int employeeNumber)
        {
            List<ApprovedReimbursement> approvedReimbursements = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeNumber, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iTARGET", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                approvedReimbursements = (await connection.QueryAsync<ApprovedReimbursement>(DatabaseProcedures.GET_REIM_BAL_PORTAL, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return approvedReimbursements;
        }

        public async Task<List<PendingReimbursement>> GetPendingBills(int employeeNumber)
        {
            List<PendingReimbursement> pendingReimbursements = null;

            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeNumber, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iTARGET", 2, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                pendingReimbursements = (await connection.QueryAsync<PendingReimbursement>(DatabaseProcedures.GET_REIM_BAL_PORTAL, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return pendingReimbursements;
        }

        public async Task<bool> DeleteReimbursementBill(int reimbursementId)
        {
            bool isDeleted = false;
            int updatedRecords = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iREIMBURSEMENTID", reimbursementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.DELETE_REIMBURSEMENT, parmeters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (updatedRecords * -1) > 0;
            return isDeleted;
        }

        public async Task<bool> UploadReimburesment(UploadReimbursmentDetails uploadReimbursmentDetails)
        {
            bool result = false;
            int recordsUpdated = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new();
                UploadReimbursmentDetails uploadReimbursmentDetails1 = await UploadFileToDirectory(uploadReimbursmentDetails);
                if (uploadReimbursmentDetails1 != null)
                {

                    parmeters.Add(name: "iBILLNO", uploadReimbursmentDetails.BillNumber, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iBILLDATE", uploadReimbursmentDetails.BillDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iAMOUNT", uploadReimbursmentDetails.Amount, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iFILENAME", uploadReimbursmentDetails1.File.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iFILEPATH", uploadReimbursmentDetails1.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iPBRANCHSLNO", uploadReimbursmentDetails.PBranchSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iMONTHSLNO", uploadReimbursmentDetails.MonthSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iEMPSLNO", uploadReimbursmentDetails.EmpSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iUNIQUENO", uploadReimbursmentDetails.UniqueNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iUSERSLNO", uploadReimbursmentDetails.UserSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iHEADSLNO", 10, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.REIMBURESMENT_FILE_UPLOAD, parmeters, commandType: CommandType.StoredProcedure);
                }
            }
            result = (recordsUpdated * -1) > 0;
            return result;
        }

        private async Task<int> GetPendingBillsTotalCount(int empSLNo)
        {
            int totalCount = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPSLNO", empSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                totalCount = (await connection.ExecuteScalarAsync<int>(DatabaseProcedures.GET_EMP_PENDING_BILLS_COUNT, parmeters, commandType: CommandType.StoredProcedure));
            }
            return totalCount;
        }
        private async Task<int> GetApprovedBillsTotalCount(int empSLNo)
        {
            int totalCount = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPSLNO", empSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                totalCount = (await connection.ExecuteScalarAsync<int>(DatabaseProcedures.GET_EMP_APPROVED_BILLS_COUNT, parmeters, commandType: CommandType.StoredProcedure));
            }
            return totalCount;
        }

        private async Task<UploadReimbursmentDetails> UploadFileToDirectory(UploadReimbursmentDetails uploadReimbursment)
        {
            UploadReimbursmentDetails uploadReimbursment1 = null;
            string fileType = Path.GetExtension(uploadReimbursment.File.FileName).ToString().ToLower();
            string fileName = string.Format("{0}{1}{2}{3}", uploadReimbursment.EmpSLNo, uploadReimbursment.UniqueNo, DateTime.Now.Ticks, fileType);
            var filePath = ApplicationSettings.Current.ReimbursementPath;
            string fullPath = Path.Combine(filePath, fileName);
            string base64String = uploadReimbursment.File.FileAsBase64.Substring(uploadReimbursment.File.FileAsBase64.IndexOf(',') + 1);
            byte[] imageBytes = Convert.FromBase64String(base64String);
            uploadReimbursment1 = new UploadReimbursmentDetails();
            File.WriteAllBytes(fullPath, imageBytes);
            uploadReimbursment1.FilePath = fullPath;
            uploadReimbursment1.File = new FileToUpload();
            uploadReimbursment1.File.FileName = fileName;
            return uploadReimbursment1;
        }
    }
}

