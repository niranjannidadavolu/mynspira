using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.LeaveManagementReports;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Phoenix.Model.Business.LeaveManagement;

namespace Phoenix.Database.Repository.LeaveManagementReports
{
    public class ReportsRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;
        private readonly IDistributedCache redisCache;
        public ReportsRepository(IConfiguration configuration, ILoggerManager logger) : base(configuration)
        {
            this.configuration = configuration;
            this.logger = logger;
        }

        public async Task<List<LeaveDetailReport>> GetLeaveReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> employeeLeaves = null;
            List<LeaveWorkFlowReport> leaveWorkFlowReport = null;
            List<LeaveFileUploadReports> leaveFileUploadReports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iPBRANCHSLNO", getLeaveReportReq.pBranchSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROM_DATE", getLeaveReportReq.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", getLeaveReportReq.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_STATUS", getLeaveReportReq.StatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "EMPL_LEAVES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_DETAILS", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_FILES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_LEAVE_REPORT, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaves = results.Read<LeaveDetailReport>().ToList();
                leaveWorkFlowReport = results.Read<LeaveWorkFlowReport>().ToList();
                leaveFileUploadReports = results.Read<LeaveFileUploadReports>().ToList();
                foreach (var item in employeeLeaves)
                {
                    item.leaveWorkFlowReport = leaveWorkFlowReport.Where(x => (x.RLeaveId == item.LeaveId)).ToList();
                    item.leaveFileUploadReports = leaveFileUploadReports.Where(x => (x.FLeaveId == item.LeaveId)).ToList();
                }
            }
            return employeeLeaves;
        }

        public async Task<List<LeaveDetail>> GetLeavesForHRApproval(LeaveReportSearchCriteria leaveReportSearchCriteria)
        {
            List<LeaveDetail> employeeLeaves = null;
            List<LeaveWorkFlowReport> leaveWorkFlowReport = null;
            List<LeaveFileUploadReports> leaveFileUploadReports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iBRANCH_SLNO", leaveReportSearchCriteria.Branches.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveReportSearchCriteria.Branches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "IFROM_DATE", leaveReportSearchCriteria.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "ITO_DATE", leaveReportSearchCriteria.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "EMPL_LEAVES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_DETAILS", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_FILES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(CrossCutting.Resources.LeaveManagement.SP_GET_LEAVES_FOR_HR_APPROVAL, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaves = results.Read<LeaveDetail>().ToList();
                leaveWorkFlowReport = results.Read<LeaveWorkFlowReport>().ToList();
                leaveFileUploadReports = results.Read<LeaveFileUploadReports>().ToList();
                //foreach (var item in employeeLeaves)
                //{
                //    item.LeaveWorkFlowReport = leaveWorkFlowReport.Where(x => (x.RLeaveId == item.LeaveId)).ToList();
                //    item.LeaveFileUploadReports = leaveFileUploadReports.Where(x => (x.FLeaveId == item.LeaveId)).ToList();
                //}
            }
            return employeeLeaves;
        }

        public async Task<List<LeaveDetailReport>> GetAllLeaves(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> employeeLeaves = null;
            //List<LeaveWorkFlowReport> leaveWorkFlowReport = null;
            List<LeaveFileUploadReports> leaveFileUploadReports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iPBRANCHSLNO", getLeaveReportReq.pBranchSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROM_DATE", getLeaveReportReq.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", getLeaveReportReq.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_STATUS", null, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "EMPL_LEAVES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_DETAILS", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_FILES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_GET_ALL_LEAVE_REPORT, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaves = results.Read<LeaveDetailReport>().ToList();
                //leaveWorkFlowReport = results.Read<LeaveWorkFlowReport>().ToList();
                //leaveFileUploadReports = results.Read<LeaveFileUploadReports>().ToList();
                //foreach (var item in employeeLeaves)
                //{
                //    //item.leaveWorkFlowReport = leaveWorkFlowReport.Where(x => (x.RLeaveId == item.LeaveId)).ToList();
                //    item.leaveFileUploadReports = leaveFileUploadReports.Where(x => (x.FLeaveId == item.LeaveId)).ToList();
                //}
            }
            return employeeLeaves;
        }

        public async Task<List<AutoApprovalReport>> GetAutoApprovalReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<AutoApprovalReport> employeeLeaves = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iPBRANCHSLNO", getLeaveReportReq.pBranchSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROM_DATE", getLeaveReportReq.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", getLeaveReportReq.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_STATUS", getLeaveReportReq.StatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "AUTO_LEAVE_APPROVAL", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_AUTO_APPROVAL_LEAVE_REPORT, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaves = results.Read<AutoApprovalReport>().ToList();
            }
            return employeeLeaves;
        }

        public async Task<List<LeaveDetailReport>> GetLeaveTransactions(GetLeaveTransactionReq getLeaveTransactionReq)
        {
            List<LeaveDetailReport> employeeLeaves = null;
            List<LeaveWorkFlowReport> leaveWorkFlowReport = null;
            List<LeaveFileUploadReports> leaveFileUploadReports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", getLeaveTransactionReq.employeeSLNo, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iREPORTINGEMPLOYEESLNO", getLeaveTransactionReq.reportingManagerSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_STATUS", getLeaveTransactionReq.statusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "EMPL_LEAVES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_DETAILS", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPL_LEAVE_FILES", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_GET_LEAVE_TRANSACTIONS, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaves = results.Read<LeaveDetailReport>().ToList();
                leaveWorkFlowReport = results.Read<LeaveWorkFlowReport>().ToList();
                leaveFileUploadReports = results.Read<LeaveFileUploadReports>().ToList();
                foreach (var item in employeeLeaves)
                {
                    item.leaveWorkFlowReport = leaveWorkFlowReport.Where(x => (x.RLeaveId == item.LeaveId)).ToList();
                    item.leaveFileUploadReports = leaveFileUploadReports.Where(x => (x.FLeaveId == item.LeaveId)).ToList();
                }
            }
            return employeeLeaves;
        }

        public async Task<List<EmployeeVerificationDetailReport>> GetEmployeeVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeVerificationDetailReport> reports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iPBRANCHSLNO", reportReq.pBranchSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROM_DATE", reportReq.fromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", reportReq.toDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                reports = (await connection.QueryAsync<EmployeeVerificationDetailReport>(DatabaseProcedures.SP_EMP_VERIFICATION_REPORT, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return reports;
        }

        public async Task<List<EmployeePanVerificationDetailReport>> GetEmployeePanVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeePanVerificationDetailReport> reports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iPBRANCHSLNO", reportReq.pBranchSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROM_DATE", reportReq.fromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", reportReq.toDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                reports = (await connection.QueryAsync<EmployeePanVerificationDetailReport>(DatabaseProcedures.SP_EMP_PAN_REPORT, parameters, commandType: CommandType.StoredProcedure)).ToList();
                foreach (var item in reports)
                {
                    item.FilePath = await ConvertFileUri(item.FilePath);
                }
            }
            return reports;
        }

        public async Task<List<EmployeeItrDetailReport>> GetEmployeeITRReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeItrDetailReport> reports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iPBRANCHSLNO", reportReq.pBranchSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROM_DATE", reportReq.fromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", reportReq.toDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                reports = (await connection.QueryAsync<EmployeeItrDetailReport>(DatabaseProcedures.SP_EMP_ITR_REPORT, parameters, commandType: CommandType.StoredProcedure)).ToList();
                foreach (var item in reports)
                {
                    item.FilePath = await ConvertFileUri(item.FilePath);
                }
            }
            return reports;
        }

        public async Task<List<LeaveDetailReport>> GetLeaveBalancesReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> employeeLeaves = null;
            List<LeaveWorkFlowReport> leaveWorkFlowReport = null;
            List<LeaveFileUploadReports> leaveFileUploadReports = null;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iPBRANCHSLNO", getLeaveReportReq.BranchSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROM_DATE", getLeaveReportReq.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", getLeaveReportReq.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "AUTO_LEAVE_APPROVAL", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_GET_LEAVE_TRANSACTIONS, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaves = results.Read<LeaveDetailReport>().ToList();
                leaveWorkFlowReport = results.Read<LeaveWorkFlowReport>().ToList();
                leaveFileUploadReports = results.Read<LeaveFileUploadReports>().ToList();
                foreach (var item in employeeLeaves)
                {
                    item.leaveWorkFlowReport = leaveWorkFlowReport.Where(x => (x.RLeaveId == item.LeaveId)).ToList();
                    item.leaveFileUploadReports = leaveFileUploadReports.Where(x => (x.FLeaveId == item.LeaveId)).ToList();
                }
            }
            return employeeLeaves;
        }
        public async Task<string> ConvertFileUri(string FilePath)
        {
            string imagePath = ApplicationSettings.Current.ProfilePath.ToString();
            string[] fileData = FilePath.Split('\\');
            if (fileData != null && fileData.Length > 0)
            {
                fileData[0] = imagePath;
            }
            string filePath = string.Join('/', fileData);
            return filePath;
        }
    }
}
