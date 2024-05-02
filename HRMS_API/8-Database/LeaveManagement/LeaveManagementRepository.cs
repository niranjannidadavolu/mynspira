using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Extension.System.DateTime;
using Phoenix.CrossCutting.Resources;
using Phoenix.CrossCutting.TimePeriod;
using Phoenix.Database.Repository.Workflow;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Attendance;
using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Phoenix.Model.Business.SearchCriteria.LeaveManagement;
using Phoenix.Database.Repository.Masters;
using Phoenix.Model.Business.Payroll;
using Phoenix.CrossCutting.Extension.System.Enum;
using Phoenix.CrossCutting.Extension.System.Int32._CoreObject;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;
using Phoenix.Model.Business.LeaveManagementReports;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using Microsoft.VisualBasic;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime;
using Phoenix.Model.Business.EmployeeVerification;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Database.Repository.LeaveManagement
{
    public class LeaveManagementRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;
        private readonly IDistributedCache redisCache;
        public LeaveManagementRepository(IConfiguration configuration, ILoggerManager logger) : base(configuration)
        {
            this.configuration = configuration;
            this.logger = logger;
        }
        public async Task<List<LeaveDetail>> GetEmployeeLeaves(int employeeSlno, int statusId)
        {
            List<LeaveDetail> employeeLeaves = null;
            PayrollPeriod payrollPeriod = await GetPayrollDates(DateTime.Now);
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_STATUS_ID", statusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "DATACUR1", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_GET_EMP_LEAVE_DETAILS, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaves = results.Read<LeaveDetail>().ToList();
                var leaveWorkFlows = results.Read<LeaveWorkFlow>().ToList();

                foreach (var item in employeeLeaves)
                {
                    item.LeaveWorkFlows = leaveWorkFlows.Where(x => x.LeaveId == item.LeaveId).OrderBy(x => x.StepMasterId).ToList();
                    item.EnableDelete = item.LeaveFrom >= payrollPeriod.FromDate ? true : false;
                    if (item.LeaveStatusId == LeaveStatusNames.PendingForApproval.ToInt32OrDefault())
                    {
                        item.EnableDelete = true;
                    }
                    else
                    {
                        item.EnableDelete = false;
                    }
                }
                //employeeLeaves = employeeLeaves.OrderByDescending(x => x.LeaveFrom).ToList();
            }
            return employeeLeaves;
        }
        public async Task<List<LeaveDetail>> GetEmployeeLeaves(EmployeeLeave leaveRequest, DateTime startDate, DateTime endDate)
        {
            //logger.LogInfo("Reached Get Employee Leaves..");
            List<LeaveDetail> empLeaves = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", leaveRequest.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iSTART_DATE", startDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iEND_DATE", endDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_START_DATE", leaveRequest.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_END_DATE", leaveRequest.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaves = (await connection.QueryAsync<LeaveDetail>(DatabaseProcedures.SP_GET_EMPLOYEE_LEAVES, parameters, commandType: CommandType.StoredProcedure)).ToList();
                empLeaves = empLeaves.OrderByDescending(x => x.LeaveFrom).ToList();
            }
            return empLeaves;
        }

        public async Task<EmpLeavePolicyDetails> GetEmpLeavesbyLeaveId(int leaveId)
        {
            //logger.LogInfo("Reached Get Employee Leaves..");
            EmpLeavePolicyDetails empLeavePolicyDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "ILEAVE_ID", leaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeavePolicyDetails = await connection.QueryFirstAsync<EmpLeavePolicyDetails>(DatabaseProcedures.SP_LEAVE_DETAILS_BYID, parameters, commandType: CommandType.StoredProcedure);
            }
            return empLeavePolicyDetails;
        }

        public async Task<List<LeaveDetail>> GetEmployeeLeavesByLeaveType(int employeeSlno, DateTime? startDate, DateTime? endDate, int leaveTypeId)
        {
            List<LeaveDetail> empLeaves = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iSTART_DATE", startDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iEND_DATE", endDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_TYPE_ID", leaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaves = (await connection.QueryAsync<LeaveDetail>(DatabaseProcedures.SP_GET_EMP_LEAVES_BY_TYPE, parameters, commandType: CommandType.StoredProcedure)).ToList();
                empLeaves = empLeaves.OrderByDescending(x => x.LeaveFrom).ToList();
            }
            return empLeaves;
        }
        public async Task<List<EmpLeaveBalance>> GetEmployeeLeaveBalance(int employeeSlno)
        {
            List<EmpLeaveBalance> empLeaveBalance = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaveBalance = (await connection.QueryAsync<EmpLeaveBalance>(DatabaseProcedures.SP_GET_EMP_LEAVES_BALANCE, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            string gender = await GetEmpGender(employeeSlno);
            bool isMarried = await CheckForMaritalStatus(employeeSlno);

            empLeaveBalance = empLeaveBalance.Where(x => x.LeaveTypeId != LeaveTypeNames.ON_DUTY.ToInt32OrDefault()).ToList();
            if (isMarried)
            {
                empLeaveBalance = empLeaveBalance.Where(x => x.LeaveTypeId != LeaveTypeNames.MARRIAGE_LEAVE.ToInt32OrDefault()).ToList();
                bool hasChildren = await CheckForChildren(employeeSlno);
                if (hasChildren)
                {
                    if (gender == "F")
                    {
                        empLeaveBalance = empLeaveBalance.Where(x => (x.LeaveTypeId != LeaveTypeNames.MATERNITY_LEAVE.ToInt32OrDefault())).ToList();

                    }
                    else if (gender == "M")
                    {
                        empLeaveBalance = empLeaveBalance.Where(x => (x.LeaveTypeId != LeaveTypeNames.PATERNITY_LEAVE.ToInt32OrDefault())).ToList();
                    }
                }
            }
            else
            {
                empLeaveBalance = empLeaveBalance.Where(x => (x.LeaveTypeId != LeaveTypeNames.PATERNITY_LEAVE.ToInt32OrDefault())).ToList();
                empLeaveBalance = empLeaveBalance.Where(x => (x.LeaveTypeId != LeaveTypeNames.MATERNITY_LEAVE.ToInt32OrDefault())).ToList();
            }

            empLeaveBalance = empLeaveBalance.Where(x => x.ShowInDashboard == 1).ToList();
            return empLeaveBalance;
        }
        private async Task<bool> CheckForMaritalStatus(int employeeSlno)
        {
            int marriageCount = 0;
            bool isMarried = false;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "OISMARRIED", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                await connection.ExecuteAsync(DatabaseProcedures.SP_CHECK_MARITAL_STATUS, parameters, commandType: CommandType.StoredProcedure);
                marriageCount = parameters.Get<int>("OISMARRIED");
            }
            isMarried = marriageCount > 0;
            return isMarried;
        }
        private async Task<bool> CheckForChildren(int employeeSlno)
        {
            int childCount = 0;
            bool hasChildren = false;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "OCHILDCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                await connection.ExecuteAsync(DatabaseProcedures.SP_CHECK_HAS_CHILDREN, parameters, commandType: CommandType.StoredProcedure);
                childCount = parameters.Get<int>("OCHILDCOUNT");
            }
            hasChildren = childCount >= 2;
            return hasChildren;
        }
        private async Task<string> GetEmpGender(int employeeSlno)
        {
            string gender = null;
            string getGenderQuery = "SELECT GENDER FROM PAYROLLNEW.P_EMP_DT  WHERE STATUS IN (1,3) AND EMPLOYEESLNO ={0}";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                string query = string.Format(getGenderQuery, employeeSlno);
                gender = await connection.QueryFirstOrDefaultAsync<string>(query);
            }
            return gender;
        }
        public async Task<bool> UpdateEmployeeLeaveStatus(LeaveDetail leaveDetail)
        {
            bool resp = false;
            int updatedRecords = 0;
            try
            {
                using (var connection = await base.CreateConnection(DbSchema.PORTAL))
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iLEAVEID", leaveDetail.LeaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ILEAVE_STATUSID", leaveDetail.LeaveStatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IEMPLOYEE_SLNO", leaveDetail.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IWORKFLOW_TYPE_ID", leaveDetail.WorkFlowTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ISTEP_TYPE_ID", leaveDetail.StepTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ISTEP_MASTER_ID", leaveDetail.StepMasterId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iREMARKS", leaveDetail.ApprovedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

                    updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.PROCESS_LEAVE_WORKFLOW, param, commandType: CommandType.StoredProcedure);

                    resp = (updatedRecords * -1) > 0;
                }
            }
            catch (Exception ex)
            {
                resp = false;
            }
            //bool isSuccess = await SaveNotification(empLeaveRequest.EmployeeSlno, "");
            //bool isMailSave = await EmailSave(leaveDetail, 0);

            return resp;

        }

        public async Task<bool> UpdateTeamLeaves(List<LeaveDetail> teamLeaves)
        {
            bool resp = false;
            int updatedRecords = 0;
            int rowsUpdated = 0;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                foreach (LeaveDetail leaveDetail in teamLeaves)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iLEAVEID", leaveDetail.LeaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ILEAVE_STATUSID", leaveDetail.LeaveStatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IEMPLOYEE_SLNO", leaveDetail.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IWORKFLOW_TYPE_ID", leaveDetail.WorkFlowTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ISTEP_TYPE_ID", leaveDetail.StepTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ISTEP_MASTER_ID", leaveDetail.StepMasterId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iREMARKS", leaveDetail.ApprovedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.PROCESS_LEAVE_WORKFLOW, param, commandType: CommandType.StoredProcedure);
                    rowsUpdated = rowsUpdated + updatedRecords * -1;
                }
                //OracleDynamicParameters parameters = new();
                //if (teamLeaves != null && teamLeaves.Count > 0)
                //{
                //    List<int>  leaveStatusId = teamLeaves.Select(x => x.LeaveStatusId).ToList();
                //    List<int> leaveId = teamLeaves.Select(x => x.LeaveId).ToList();
                //    List<int> workFlowTypeId = teamLeaves.Select(x => x.WorkFlowTypeId).ToList();
                //    List<int> stepTypeId = teamLeaves.Select(x => x.StepTypeId).ToList();
                //    List<int> stepMasterId = teamLeaves.Select(x => x.StepMasterId).ToList();
                //    //List<int> approvedBy = teamLeaves.Select(x => x.ApprovedBy).ToList();
                //    List<int> employeeslno = teamLeaves.Select(x => x.EmployeeSlno).ToList();
                //    List<string> approvedRemarks = teamLeaves.Select(x => x.ApprovedRemarks).ToList();

                //    parameters.Add(name: "ILEAVEID", leaveId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveId.Count,
                //                   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    parameters.Add(name: "IWORKFLOW_TYPE_ID", workFlowTypeId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, workFlowTypeId.Count,
                //                   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    parameters.Add(name: "ISTEP_TYPE_ID", stepTypeId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, stepTypeId.Count,
                //                   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    parameters.Add(name: "ISTEP_MASTER_ID", stepMasterId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, stepMasterId.Count,
                //                   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    parameters.Add(name: "ILEAVE_STATUSID", leaveStatusId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveStatusId.Count,
                //                   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    parameters.Add(name: "IEMPLOYEE_SLNO", employeeslno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeslno.Count,
                //                   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    //parameters.Add(name: "IEMPLOYEE_SLNO", approvedBy.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, approvedBy.Count,
                //    //               collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    parameters.Add(name: "IREMARKS", approvedRemarks.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, approvedRemarks.Count,
                //                   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //    parameters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                //    updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.APPROVE_TEAM_LEAVES, parameters, commandType: CommandType.StoredProcedure);
                //    rowsUpdated = parameters.Get<int>("AFFECTEDROWCOUNT");
                //}
            }

            resp = ((updatedRecords * -1) > 0);
            return resp;
        }
        public async Task<bool> UpdateTeamLeavesByHR(List<LeaveDetail> teamLeaves)
        {
            bool resp = false;
            int updatedRecords = 0;
            int rowsUpdated = 0;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                foreach (LeaveDetail leaveDetail in teamLeaves)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iLEAVEID", leaveDetail.LeaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ILEAVE_STATUSID", leaveDetail.LeaveStatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IEMPLOYEE_SLNO", leaveDetail.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IHR_EMPLOYEE_SLNO", leaveDetail.HREmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IWORKFLOW_TYPE_ID", leaveDetail.WorkFlowTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ISTEP_TYPE_ID", leaveDetail.StepTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "ISTEP_MASTER_ID", leaveDetail.StepMasterId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iREMARKS", leaveDetail.ApprovedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    updatedRecords = await connection.ExecuteAsync(CrossCutting.Resources.LeaveManagement.PROCESS_LEAVE_WORKFLOW_FOR_HR, param, commandType: CommandType.StoredProcedure);
                    rowsUpdated = rowsUpdated + updatedRecords * -1;
                }
            }

            resp = ((updatedRecords * -1) > 0);
            return resp;
        }
        public async Task<bool> CancelLeave(int leaveId, int updatedBy)
        {
            bool resp = false;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters param = new();
                param.Add(name: "iLEAVEID", leaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IUPDATEDBY", updatedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                int updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.CANCEL_EMPLOYEE_LEAVE, param, commandType: CommandType.StoredProcedure);
                resp = (updatedRecords * -1) > 0;
            }
            return resp;

        }
        public async Task<EmpLeaveResponse> SaveEmployeeLeave(EmployeeLeave leaveRequest)
        {
            EmpLeaveResponse response = null;
            double totalDays = 0.0;
            List<DateTime> dateRanges = null;
            List<DateTime> leaveAppliedDates = null;
            List<DateTime> publicHolidays = null;
            List<DateTime> holidayDates = null;
            List<DateTime> leaveDates = null;
            DateTime payrollPeriodStartDate;
            DateTime payrollPeriodEndDate;
            dateRanges = leaveRequest.FromDate.GetDateRange(leaveRequest.ToDate).ToList();
            if (dateRanges.Count > 0)
            {
                leaveAppliedDates = dateRanges;
            }
            publicHolidays = await GetOrganizationHolidays(leaveRequest.EmployeeSlno, leaveRequest.FromDate);
            holidayDates = publicHolidays.Where(x => x.Date >= leaveRequest.FromDate && x.Date <= leaveRequest.ToDate).ToList();
            LeaveTypeNames leaveType = (LeaveTypeNames)leaveRequest.LeaveType.LeaveTypeId;

            if (leaveAppliedDates != null)
            {
                if (leaveRequest.LeaveType.IsWeekEndHoliDays == false)
                {
                    leaveAppliedDates.RemoveAll(x => holidayDates.Contains(x.Date));
                }
                leaveAppliedDates = leaveAppliedDates.OrderBy(x => x.Date).ToList();
            }

            leaveDates = leaveAppliedDates;

            if (leaveDates != null && leaveDates.Count > 0)
            {
                totalDays = leaveDates.Count;

                if (leaveDates.Count > 1 && (leaveRequest.FromDateDayTypeId == LeaveDayTypeNames.SecondHalf.ToInt32OrDefault()))
                {
                    totalDays = totalDays - 0.5;
                }
                if (leaveDates.Count > 1 && (leaveRequest.ToDateDayTypeId == LeaveDayTypeNames.FirstHalf.ToInt32OrDefault()))
                {
                    totalDays = totalDays - 0.5;
                }
                if (leaveDates.Count == 1 && leaveRequest.LeaveType.CanApplyHalfDay && leaveRequest.FromDateDayTypeId != LeaveDayTypeNames.FullDay.ToInt32OrDefault())
                {
                    totalDays = totalDays - 0.5;
                }

            }


            PayrollPeriod payrollPeriod = await GetPayrollDates(leaveRequest.FromDate);
            payrollPeriodStartDate = payrollPeriod.FromDate.StartOfYear();
            payrollPeriodEndDate = payrollPeriod.ToDate.EndOfYear();
            List<LeaveDetail> appliedLeaves = await GetEmployeeLeaves(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate);
            response = CheckForOverLappingPeriods(leaveDates, leaveRequest, appliedLeaves);
            if (!response.Response)
            {
                return response;
            }
            if (leaveRequest.LeaveType.LeaveTypeId == LeaveTypeNames.ON_DUTY.ToInt32OrDefault())
            {
                ApplyingFor applyingFor = (ApplyingFor)leaveRequest.ApplyingFor;
                switch (applyingFor)
                {
                    case ApplyingFor.Self:
                        leaveRequest.SelectedEmployees = new List<int>();
                        leaveRequest.SelectedEmployees.Add(leaveRequest.EmployeeSlno);
                        break;
                }

                if (!response.Response)
                {
                    return response;
                }

                bool isSaved = await ApplyOnDuty(leaveDates, totalDays, leaveRequest.SelectedEmployees, leaveRequest.EmployeeSlno, leaveRequest);


                if (isSaved)
                {
                    response = new EmpLeaveResponse
                    {
                        Response = true,
                        Message = "Your leave request is sucessfully submitted"
                    };
                }

            }
            else
            {
                List<EmpLeaveBalance> leaveBalances = await GetEmployeeLeaveBalance(leaveRequest.EmployeeSlno);
                EmpLeaveBalance employeeLeaveBalance = leaveBalances.Where(x => x.LeaveTypeId == leaveRequest.LeaveType.LeaveTypeId).FirstOrDefault();
                if (employeeLeaveBalance != null && employeeLeaveBalance.AvailableLeaveBalance < totalDays)
                {
                    response = new EmpLeaveResponse
                    {
                        Response = false,
                        Message = "Sorry, you donot have enough leave balance."
                    };
                    return response;
                }
                //leaveDates = GetLeaveAppliedDates(leaveRequest, leaveAppliedDates, weekEndDates, holidayDates, publicHolidays);

                //TODO: Apply Policies
                //List<LeaveDetail> appliedLeaves = await GetEmployeeLeaves(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate);
                //response = CheckForOverLappingPeriods(leaveAppliedDates, leaveRequest, appliedLeaves);
                //if (!response.Response)
                //{
                //    return response;
                //}

                response = await ValidateLeavePolicies(leaveDates, leaveRequest, totalDays, payrollPeriodStartDate, payrollPeriodEndDate);
                if (response.Response && totalDays > 0)
                {
                    await LeaveSave(leaveRequest, totalDays, holidayDates, leaveDates, leaveAppliedDates);
                }
                else
                {
                    return response;
                }
            }

            return response;
        }

        private async Task<PayrollPeriod> GetPayrollDates(DateTime fromDate)
        {
            PayrollPeriod payrollPeriod = null;
            Dictionary<string, DateTime> payrollDates = new Dictionary<string, DateTime>();
            using (var connection = new PayrollPeriodRepository(this.configuration))
            {
                payrollPeriod = await connection.GetPayrollDates(fromDate);
            }
            return payrollPeriod;
        }

        public async Task<List<LeaveDetail>> GetLeavesWaitingForApproval(LeaveSearchCriteria searchCriteria)
        {
            List<LeaveDetail> employeeList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", searchCriteria.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IFROM_DATE", searchCriteria.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "ITO_DATE", searchCriteria.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                employeeList = (await connection.QueryAsync<LeaveDetail>(DatabaseProcedures.GET_LEAVES_WAIT_FOR_APPROVAL, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in employeeList)
            {
                string[] imagesPath = null;
                StringBuilder imagePath = new StringBuilder();
                imagesPath = item.PhotoPath.Split('/');
                imagePath.AppendFormat("{0}/photos/{1}", ApplicationSettings.Current.ProfilePath, imagesPath[2]);
                item.PhotoPath = imagePath.ToString();
            }
            return employeeList;
        }
        public async Task<List<EmployeeLeaveReport>> GetMyTeamLeaves(LeaveSearchCriteria searchCriteria)
        {
            List<EmployeeLeaveReport> employeeList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "IEMPLOYEESLNO", searchCriteria.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IFROM_DATE", searchCriteria.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "IEND_DATE", searchCriteria.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                employeeList = (await connection.QueryAsync<EmployeeLeaveReport>(DatabaseProcedures.GET_TEAM_LEAVES, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            //foreach (var item in employeeList)
            //{
            //    string[] imagesPath = null;
            //    StringBuilder imagePath = new StringBuilder();
            //    imagesPath = item.PhotoPath.Split('/');
            //    imagePath.AppendFormat("{0}/photos/{1}", ApplicationSettings.Current.ProfilePath, imagesPath[2]);
            //    item.PhotoPath = imagePath.ToString();
            //}
            return employeeList;
        }
        public async Task<List<GetTeamEmpLeavesData>> GetMyTeamEmployeeLeaves(LeaveSearchCriteria searchCriteria)
        {
            List<GetTeamEmpLeavesData> leaveList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", searchCriteria.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IFROM_DATE", searchCriteria.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "IEND_DATE", searchCriteria.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                leaveList = (await connection.QueryAsync<GetTeamEmpLeavesData>(DatabaseProcedures.GET_TEAM_EMP_LEAVES, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return leaveList;
        }

        public async Task<List<LeaveDetail>> GetManagerApprovalLeaves(int employeeSlno)
        {
            List<LeaveDetail> empLeaves = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaves = (await connection.QueryAsync<LeaveDetail>(DatabaseProcedures.SP_GET_MNGR_APRVL_LEAVE_RECENT, parameters, commandType: CommandType.StoredProcedure)).ToList();
                empLeaves = empLeaves.OrderByDescending(x => x.LeaveFrom).ToList();
            }
            return empLeaves;
        }
        public async Task<bool> ApplyOnDuty(List<DateTime> selectedDates, double totalDays, List<int> selectedEmployees, int reportingManagerId, EmployeeLeave leaveRequest)
        {
            bool resp = false;
            bool isSaveWorkFlow = false;
            int savedRecords = 0;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                using (var tran = connection.BeginTransaction())
                {
                    foreach (int employeeSlno in selectedEmployees)
                    {
                        parameters = new OracleDynamicParameters();
                        parameters.Add(name: "iEMPLOYEE_LEAVE_ENTITLEMENT_ID", leaveRequest.LeaveType.EntitlementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iDATE_LEAVE_FROM", leaveRequest.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                        parameters.Add(name: "iDATE_LEAVE_TO", leaveRequest.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                        parameters.Add(name: "iLEAVE_TYPE_ID", leaveRequest.LeaveType.LeaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iREMARKS", leaveRequest.Remarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iLEAVE_DAY_TYPE_ID", leaveRequest.FromDateDayTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iTOTAL_DAYS_TAKEN", totalDays, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                        parameters.Add(name: "iTOTAL_PUBLIC_HOLIDAYS", 0, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iTOTAL_HOLIDAYS", 0, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iTOTAL_UNPAID_DAYS", 0, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iLEAVE_STATUS_ID", leaveRequest.ApplyingFor == ApplyingFor.Self.ToInt32OrDefault() ? LeaveStatusNames.PendingForApproval.ToInt32OrDefault() : LeaveStatusNames.Approved.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "IFROM_DATE_DAY_TYPE_ID", leaveRequest.FromDateDayTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "ITO_DATE_DAY_TYPE_ID", leaveRequest.ToDateDayTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "iROW_VERSION", Guid.NewGuid().ToString(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        parameters.Add(name: "iCOMP_OFF_DATE", leaveRequest.CompOffDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                        parameters.Add(name: "iEARLY_LOGOUT_TIME", leaveRequest.RatificationTime, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "ILEAVE_REASON_ID", leaveRequest.LeaveTypeReason == null ? null : leaveRequest.LeaveTypeReason.ReasonId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        parameters.Add(name: "oEMPLOYEE_LEAVE_ID", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                        savedRecords += await connection.ExecuteAsync(DatabaseProcedures.INSERT_EMP_LEAVE, parameters, commandType: CommandType.StoredProcedure);
                        var parentId = parameters.Get<int>("oEMPLOYEE_LEAVE_ID");
                        List<EmpLeaveDetails> empLeaveDetails = new List<EmpLeaveDetails>();
                        EmpLeaveDetails empLeaveData = new EmpLeaveDetails();
                        int rowIndex = 0;
                        foreach (DateTime onDutyDate in selectedDates)
                        {
                            empLeaveData = new EmpLeaveDetails();
                            empLeaveData.EmployeeLeaveId = parentId;
                            empLeaveData.RowVersion = Guid.NewGuid().ToString();
                            empLeaveData.Remarks = leaveRequest.Remarks;
                            empLeaveData.EmployeeSlno = leaveRequest.EmployeeSlno;
                            empLeaveData.LeaveDate = onDutyDate;
                            empLeaveData.LeaveDayTypeId = rowIndex == 0 ? (rowIndex == 0 ? leaveRequest.FromDateDayTypeId : LeaveDayTypeNames.FullDay.ToInt32OrDefault()) : (rowIndex == selectedDates.Count ? leaveRequest.ToDateDayTypeId : LeaveDayTypeNames.FullDay.ToInt32OrDefault());
                            empLeaveData.LeaveStatusId = LeaveStatusNames.PendingForApproval.ToInt32OrDefault();
                            empLeaveDetails.Add(empLeaveData);
                            rowIndex++;
                        }
                        parameters = new OracleDynamicParameters();
                        List<OracleDynamicParameters> param = new();

                        List<int> employeeIds = empLeaveDetails.Select(x => x.EmployeeSlno).ToList();
                        List<int> employeeLeaveId = empLeaveDetails.Select(x => x.EmployeeLeaveId).ToList();
                        List<DateTime> employeeLeaveDates = empLeaveDetails.Select(x => x.LeaveDate).ToList();
                        List<int> leaveDayTypeIds = empLeaveDetails.Select(x => x.LeaveDayTypeId).ToList();
                        List<int> leaveStatusIds = empLeaveDetails.Select(x => x.LeaveStatusId).ToList();
                        List<string> remarks = empLeaveDetails.Select(x => x.Remarks).ToList();
                        List<string> rowVersions = empLeaveDetails.Select(x => x.RowVersion).ToList();

                        parameters.Add(name: "iEMPLOYEESLNO", employeeIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeIds.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                        parameters.Add(name: "iEMPLOYEELEAVEID", employeeLeaveId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeLeaveId.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                        parameters.Add(name: "iLEAVEDATE", employeeLeaveDates.ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, employeeLeaveDates.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                        parameters.Add(name: "iLEAVEDAYTYPEID", leaveDayTypeIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveDayTypeIds.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                        parameters.Add(name: "iLEAVESTATUSID", leaveStatusIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveStatusIds.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                        parameters.Add(name: "iREMARKS", remarks.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, remarks.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                        parameters.Add(name: "iROWVERSION", rowVersions.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, rowVersions.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                        parameters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                        int updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.INSERT_EMP_LEAVE_DETAILS, parameters, commandType: CommandType.StoredProcedure);
                        int rowsUpdated = parameters.Get<int>("AFFECTEDROWCOUNT");

                        savedRecords = savedRecords + rowsUpdated;

                        //parameters = new OracleDynamicParameters();
                        //foreach (DateTime onDutyDate in selectedDates)
                        //{
                        //    OracleDynamicParameters param = new OracleDynamicParameters();
                        //    parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        //    parameters.Add(name: "iEMPLOYEELEAVEID", parentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        //    parameters.Add(name: "iLEAVEDATE", onDutyDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                        //    parameters.Add(name: "iLEAVEDAYTYPEID", LeaveDayTypeNames.FullDay.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        //    parameters.Add(name: "iLEAVESTATUSID", leaveRequest.ApplyingFor == ApplyingFor.Self.ToInt32OrDefault() ? LeaveStatusNames.PendingForApproval.ToInt32OrDefault() : LeaveStatusNames.Approved.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                        //    parameters.Add(name: "iREMARKS", leaveRequest.Remarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        //    parameters.Add(name: "iROWVERSION", Guid.NewGuid().ToStringOrDefault(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                        //    savedRecords += await connection.ExecuteAsync(DatabaseProcedures.INSERT_EMP_LEAVE_DETAILS, parameters, commandType: CommandType.StoredProcedure);
                        //}

                        using (WorkFlowInformationRepository repository = new WorkFlowInformationRepository(connection, this.configuration))
                        {
                            isSaveWorkFlow = await repository.InitiateLeaveWorkFlow(leaveRequest.EmployeeSlno, parentId, leaveRequest);
                        }
                    }
                    tran.Commit();
                }
            }
            return resp = (savedRecords * -1) > 0;
        }
        private async Task<List<LeaveDetail>> GetEmployeeLeavesBeforeStartDate(int employeeSlno, DateTime leaveStartDate)
        {
            List<LeaveDetail> empLeaves = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iSTART_DATE", leaveStartDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaves = (await connection.QueryAsync<LeaveDetail>(DatabaseProcedures.SP_GET_EMP_LEAVES_BF_STDATE, parameters, commandType: CommandType.StoredProcedure)).ToList();
                empLeaves = empLeaves.OrderByDescending(x => x.LeaveFrom).ToList();
            }
            return empLeaves;
        }
        private async Task<List<LeaveDetail>> GetEmployeeLeavesAfterEndDate(int employeeSlno, DateTime leaveEndDate)
        {
            List<LeaveDetail> empLeaves = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iEND_DATE", leaveEndDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaves = (await connection.QueryAsync<LeaveDetail>(DatabaseProcedures.SP_GET_EMP_LEAVES_AF_TODATE, parameters, commandType: CommandType.StoredProcedure)).ToList();
                empLeaves = empLeaves.OrderByDescending(x => x.LeaveFrom).ToList();
            }
            return empLeaves;
        }

        //private async Task<bool> EmailSave(LeaveDetail leaveRequest, double totalDays)
        //{
        //    //bool resp = false;
        //    var filePath = ApplicationSettings.Current.Environment;
        //    int EmailsavedRecords = 0;
        //    OracleDynamicParameters parameters = null;
        //    using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
        //    {
        //        using (var tran = connection.BeginTransaction())
        //        {
        //            parameters = new OracleDynamicParameters();
        //            parameters.Add(name: "iEMPLOYEESLNO", leaveRequest.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iDATE_LEAVE_FROM", leaveRequest.LeaveFrom, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iDATE_LEAVE_TO", leaveRequest.LeaveTo, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iLEAVE_TYPE_ID", leaveRequest.LeaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iREMARKS", leaveRequest.Remarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iLEAVE_DAY_TYPE_ID", leaveRequest.FromDateDayTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iTOTAL_DAYS_TAKEN", totalDays, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iSTEPMASTERID", leaveRequest.StepMasterId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iLEAVESTATUSID", leaveRequest.LeaveStatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //            parameters.Add(name: "EMPLOYEE_LEAVE_ID", dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //            parameters.Add(name: "iENVIRONMENT", filePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

        //            EmailsavedRecords = await connection.ExecuteAsync(DatabaseProcedures.INSERT_EMP_EMAIL, parameters, commandType: CommandType.StoredProcedure);

        //            tran.Commit();

        //            //SendMessageS();
        //        }
        //    }

        //    return true;
        //}
        private async Task<bool> LeaveSave(EmployeeLeave leaveRequest, double totalDays, List<DateTime> holidayDates, List<DateTime> leaveDates, List<DateTime> leaveAppliedDates)
        {
            bool resp = false;
            bool isSaveWorkFlow = false;
            int savedRecords = 0;
            int EmailsavedRecords = 0;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {

                using (var tran = connection.BeginTransaction())
                {
                    parameters = new OracleDynamicParameters();
                    parameters.Add(name: "iEMPLOYEE_LEAVE_ENTITLEMENT_ID", leaveRequest.LeaveType.EntitlementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iEMPLOYEESLNO", leaveRequest.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iDATE_LEAVE_FROM", leaveRequest.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                    parameters.Add(name: "iDATE_LEAVE_TO", leaveRequest.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                    parameters.Add(name: "iLEAVE_TYPE_ID", leaveRequest.LeaveType.LeaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iREMARKS", leaveRequest.Remarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iLEAVE_DAY_TYPE_ID", leaveRequest.FromDateDayTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTOTAL_DAYS_TAKEN", totalDays, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTOTAL_PUBLIC_HOLIDAYS", 0, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTOTAL_HOLIDAYS", 0, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTOTAL_UNPAID_DAYS", 0, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "IFROM_DATE_DAY_TYPE_ID", leaveRequest.FromDateDayTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "ITO_DATE_DAY_TYPE_ID", leaveRequest.ToDateDayTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iLEAVE_STATUS_ID", LeaveStatusNames.PendingForApproval.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iROW_VERSION", Guid.NewGuid().ToString(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iCOMP_OFF_DATE", leaveRequest.CompOffDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                    parameters.Add(name: "iEARLY_LOGOUT_TIME", leaveRequest.RatificationTime, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "oEMPLOYEE_LEAVE_ID", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                    parameters.Add(name: "ILEAVE_REASON_ID", leaveRequest.LeaveTypeReason == null ? null : leaveRequest.LeaveTypeReason.ReasonId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    savedRecords = await connection.ExecuteAsync(DatabaseProcedures.INSERT_EMP_LEAVE, parameters, commandType: CommandType.StoredProcedure);

                    var parentId = parameters.Get<int>("oEMPLOYEE_LEAVE_ID");
                    List<EmpLeaveDetails> empLeaveDetails = new List<EmpLeaveDetails>();
                    EmpLeaveDetails empLeaveData = new EmpLeaveDetails();
                    int rowIndex = 0;
                    foreach (var item in leaveDates)
                    {
                        empLeaveData = new EmpLeaveDetails();
                        empLeaveData.EmployeeLeaveId = parentId;
                        empLeaveData.RowVersion = Guid.NewGuid().ToString();
                        empLeaveData.Remarks = leaveRequest.Remarks;
                        empLeaveData.EmployeeSlno = leaveRequest.EmployeeSlno;
                        empLeaveData.LeaveDate = item;
                        empLeaveData.LeaveDayTypeId = GetDayTypeId(rowIndex, leaveRequest, leaveAppliedDates.Count);
                        empLeaveData.LeaveStatusId = LeaveStatusNames.PendingForApproval.ToInt32OrDefault();
                        empLeaveDetails.Add(empLeaveData);
                        rowIndex++;
                    }
                    parameters = new OracleDynamicParameters();
                    List<OracleDynamicParameters> param = new();

                    List<int> employeeSlno = empLeaveDetails.Select(x => x.EmployeeSlno).ToList();
                    List<int> employeeLeaveId = empLeaveDetails.Select(x => x.EmployeeLeaveId).ToList();
                    List<DateTime> employeeLeaveDates = empLeaveDetails.Select(x => x.LeaveDate).ToList();
                    List<int> leaveDayTypeIds = empLeaveDetails.Select(x => x.LeaveDayTypeId).ToList();
                    List<int> leaveStatusIds = empLeaveDetails.Select(x => x.LeaveStatusId).ToList();
                    List<string> remarks = empLeaveDetails.Select(x => x.Remarks).ToList();
                    List<string> rowVersions = empLeaveDetails.Select(x => x.RowVersion).ToList();

                    parameters.Add(name: "iEMPLOYEESLNO", employeeSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iEMPLOYEELEAVEID", employeeLeaveId.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeLeaveId.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iLEAVEDATE", employeeLeaveDates.ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, employeeLeaveDates.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iLEAVEDAYTYPEID", leaveDayTypeIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveDayTypeIds.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iLEAVESTATUSID", leaveStatusIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveStatusIds.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iREMARKS", remarks.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, remarks.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iROWVERSION", rowVersions.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, rowVersions.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                    int updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.INSERT_EMP_LEAVE_DETAILS, parameters, commandType: CommandType.StoredProcedure);
                    int rowsUpdated = parameters.Get<int>("AFFECTEDROWCOUNT");

                    savedRecords = savedRecords + rowsUpdated;

                    LeaveDetail leaveRequest1 = new LeaveDetail();

                    leaveRequest1.EmployeeSlno = leaveRequest.EmployeeSlno;
                    leaveRequest1.LeaveFrom = leaveRequest.FromDate;
                    leaveRequest1.LeaveTo = leaveRequest.ToDate;
                    leaveRequest1.LeaveTypeId = leaveRequest.LeaveType.LeaveTypeId;
                    leaveRequest1.Remarks = leaveRequest.Remarks;
                    leaveRequest1.FromDateDayTypeId = leaveRequest.FromDateDayTypeId;
                    leaveRequest1.StepMasterId = 1;
                    leaveRequest1.LeaveStatusId = 1;


                    //  bool isMailSave = await EmailSave(leaveRequest1, totalDays);


                    if (leaveRequest.LeaveType.LeaveTypeId != Convert.ToInt32(LeaveTypeNames.ON_DUTY))
                    {
                        await UpdateConsumedLeaves(connection, leaveRequest, totalDays);
                    }

                    using (WorkFlowInformationRepository repository = new WorkFlowInformationRepository(connection, this.configuration))
                    {
                        isSaveWorkFlow = await repository.InitiateLeaveWorkFlow(leaveRequest.EmployeeSlno, parentId, leaveRequest);
                    }
                    if (leaveRequest.LeaveType.IsDocumentRequired)
                    {
                        await UploadLeaveFile(leaveRequest, parentId, connection);
                    }
                    tran.Commit();


                }

            }
            resp = ((savedRecords * -1) > 0) && isSaveWorkFlow;
            return resp;
        }

        private int GetDayTypeId(int rowIndex, EmployeeLeave leaveRequest, int totalDays)
        {
            int dayTypeId = 1;
            //rowIndex == 0 ? (rowIndex == 0 ? leaveRequest.FromDateDayTypeId : LeaveDayTypeNames.FullDay.ToInt32OrDefault()) : (rowIndex == leaveAppliedDates.Count ? leaveRequest.ToDateDayTypeId : LeaveDayTypeNames.FullDay.ToInt32OrDefault())
            if (rowIndex == 0)
            {
                if (leaveRequest.FromDateDayTypeId == LeaveDayTypeNames.FirstHalf.ToInt32OrDefault())
                {
                    if (totalDays > 1)
                    {
                        dayTypeId = LeaveDayTypeNames.FullDay.ToInt32OrDefault();
                    }
                    else
                    {
                        dayTypeId = LeaveDayTypeNames.FirstHalf.ToInt32OrDefault();
                    }
                }
                else if (leaveRequest.FromDateDayTypeId == LeaveDayTypeNames.SecondHalf.ToInt32OrDefault())
                {
                    dayTypeId = LeaveDayTypeNames.SecondHalf.ToInt32OrDefault();
                }
            }
            if ((rowIndex + 1) == totalDays)
            {
                int firstDayTypeId = leaveRequest.FromDateDayTypeId;
                if (leaveRequest.ToDateDayTypeId == LeaveDayTypeNames.FirstHalf.ToInt32OrDefault())
                {
                    dayTypeId = LeaveDayTypeNames.FirstHalf.ToInt32OrDefault();
                }
                else if (leaveRequest.ToDateDayTypeId == LeaveDayTypeNames.SecondHalf.ToInt32OrDefault())
                {
                    if (totalDays > 1)
                    {
                        dayTypeId = LeaveDayTypeNames.FullDay.ToInt32OrDefault();
                    }
                    else
                    {
                        dayTypeId = LeaveDayTypeNames.SecondHalf.ToInt32OrDefault();
                    }
                }
            }
            return dayTypeId;
        }

        private async Task<EmpLeaveResponse> ValidateLeavePolicies(List<DateTime> leaveAppliedDates, EmployeeLeave leaveRequest, double totalDays, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate)
        {
            LeaveTypeNames leaveType = (LeaveTypeNames)leaveRequest.LeaveType.LeaveTypeId;
            List<LeaveDetail> appliedLeaves = await GetEmployeeLeaves(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate);
            //Validate Overlapping Leaves
            EmpLeaveResponse response = new EmpLeaveResponse();
            //if (response != null && !response.Response)
            //{
            //    return response;
            //}
            //Validating Half day leave
            if (!leaveRequest.LeaveType.CanApplyHalfDay)
            {
                if ((leaveRequest.FromDateDayTypeId == LeaveDayTypeNames.FirstHalf.ToInt32OrDefault() || leaveRequest.FromDateDayTypeId == LeaveDayTypeNames.SecondHalf.ToInt32OrDefault() ||
                    leaveRequest.ToDateDayTypeId == LeaveDayTypeNames.FirstHalf.ToInt32OrDefault() || leaveRequest.ToDateDayTypeId == LeaveDayTypeNames.SecondHalf.ToInt32OrDefault()))
                {
                    response = new EmpLeaveResponse()
                    {
                        Response = false,
                        Message = string.Format("You can not consume a Half day leave for <strong>{0}</strong>.", leaveType.GetCustomAttributeDescription())
                    };
                    return response;
                }
            }
            switch (leaveType)
            {
                case LeaveTypeNames.CASUAL_LEAVE:
                    response = await ValidateCasualLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.CASUAL_LEAVE, totalDays);
                    break;
                case LeaveTypeNames.SICK_LEAVE:
                    response = new EmpLeaveResponse()
                    {
                        Response = true,
                        Message = "OK"
                    };
                    break;

                case LeaveTypeNames.PATERNITY_LEAVE:
                    response = await ValidatePaternityLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.PATERNITY_LEAVE, totalDays);
                    break;
                case LeaveTypeNames.MATERNITY_LEAVE:
                    response = await ValidateMaternityLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.MATERNITY_LEAVE, totalDays);
                    break;
                case LeaveTypeNames.MARRIAGE_LEAVE:
                    response = await ValidateMarriageLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.MARRIAGE_LEAVE);
                    break;
                case LeaveTypeNames.BEREAVEMENT_LEAVE:
                    response = await ValidateBereavementLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.BEREAVEMENT_LEAVE);
                    break;
                case LeaveTypeNames.SUMMER_VACATION:
                    response = await ValidateSummerVacation(leaveRequest, totalDays);
                    break;
                case LeaveTypeNames.WINTER_VACATION:
                    response = await ValidateWinterVacation(leaveRequest, totalDays);
                    break;
                case LeaveTypeNames.SPECIAL_CASUAL_LEAVE:
                    response = await ValidateSpecialCasualLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.SPECIAL_CASUAL_LEAVE, totalDays);
                    break;
                case LeaveTypeNames.EARNED_LEAVE:
                    response = await ValidatePrivilegeLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, totalDays, LeaveTypeNames.EARNED_LEAVE);
                    break;
                case LeaveTypeNames.EARLY_LOGOUT_TIME:
                    response = await ValidateEarlyLogoutTimePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.EARLY_LOGOUT_TIME);
                    break;
                case LeaveTypeNames.COVID_LEAVE:
                case LeaveTypeNames.SPECIAL_SICK_LEAVE:
                    response = await ValidateSpecialSickLeavePolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, LeaveTypeNames.SPECIAL_SICK_LEAVE);
                    break;
                case LeaveTypeNames.SESSION_BREAK:
                    response = await ValidateSessionBreakLeavePolicy(leaveRequest, LeaveTypeNames.SESSION_BREAK, totalDays);
                    break;
                default:
                    response = new EmpLeaveResponse()
                    {
                        Response = true,
                        Message = "OK"
                    };
                    break;
            }

            return response;
        }
        private async Task<EmpLeaveResponse> ValidatePrefixSuffixPolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType, double totalDays)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> beforeLeaves = null;
            List<LeaveDetail> beforePreviousLeaves = null;
            List<LeaveDetail> afterLeaves = null;
            List<LeaveDetail> afterNextLeaves = null;
            DateTime previousDay = DateTime.Now;
            DateTime beforepreviousDay = DateTime.Now;
            DateTime nextDay = DateTime.Now;
            DateTime nexttoNextDay = DateTime.Now;
            List<DateTime> publicHolidays = null;

            previousDay = leaveRequest.FromDate.AddDays(-1);
            beforepreviousDay = leaveRequest.FromDate.AddDays(-2);
            nextDay = leaveRequest.ToDate.AddDays(1);
            nexttoNextDay = leaveRequest.ToDate.AddDays(2);
            publicHolidays = await GetOrganizationHolidays(leaveRequest.EmployeeSlno, payrollPeriodStartDate);

            beforeLeaves = await GetEmployeeLeavesBeforeStartDate(leaveRequest.EmployeeSlno, previousDay);
            beforePreviousLeaves = await GetEmployeeLeavesBeforeStartDate(leaveRequest.EmployeeSlno, beforepreviousDay);
            afterLeaves = await GetEmployeeLeavesAfterEndDate(leaveRequest.EmployeeSlno, nextDay);
            afterNextLeaves = await GetEmployeeLeavesAfterEndDate(leaveRequest.EmployeeSlno, nexttoNextDay);

            LeaveDetail previousLeave = beforeLeaves.MaxBy(x => x.LeaveTo);
            LeaveDetail previoustopreviousLeave = beforePreviousLeaves.MaxBy(x => x.LeaveTo);
            LeaveDetail nextLeave = afterLeaves.MinBy(x => x.LeaveFrom);
            LeaveDetail nexttoNextLeave = afterNextLeaves.MinBy(x => x.LeaveFrom);

            if (previousLeave != null)
            {

                if (previousLeave.LeaveTypeId != LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault() && previousLeave.LeaveTypeId != LeaveTypeNames.ON_DUTY.ToInt32OrDefault() && previousLeave.TotalDaysTaken >= 2 && previousLeave.LeaveTo.Date == leaveRequest.FromDate.AddDays(-1).Date)
                {
                    response = new EmpLeaveResponse()
                    {
                        Response = false,
                        Message = string.Format("You should not apply for the <strong>{0}</strong> preceding with any other leaves.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                    };
                }

                if (previousLeave.LeaveTypeId.NotIn(new int[] { LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault(), LeaveTypeNames.ON_DUTY.ToInt32OrDefault() }) && previousLeave.TotalDaysTaken == 1 && totalDays >= 2 && previousLeave.LeaveTo.Date == leaveRequest.FromDate.AddDays(-1).Date)
                {
                    response = new EmpLeaveResponse()
                    {
                        Response = false,
                        Message = string.Format("You should not apply for the <strong>{0}</strong> preceding with any other leaves.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                    };
                }
                if (leaveRequest.LeaveType.CheckForHoliday)
                {
                    DateTime previousHolidayCheck = publicHolidays.Where(x => x.Date == previousDay.Date).FirstOrDefault();
                    if (previoustopreviousLeave != null && previousHolidayCheck != DateTime.MinValue)
                    {
                        if (previousLeave.LeaveTypeId.NotIn(new int[] { LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault(), LeaveTypeNames.ON_DUTY.ToInt32OrDefault() })
                                && previousHolidayCheck.Day == leaveRequest.FromDate.AddDays(-1).Day
                                && previoustopreviousLeave.LeaveTo.Day == leaveRequest.FromDate.AddDays(-2).Day
                                && previousHolidayCheck != DateTime.MinValue)
                        {
                            response = new EmpLeaveResponse()
                            {
                                Response = false,
                                Message = string.Format("You should not apply for the <strong>{0}</strong> preceding with any other leaves.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                            };
                        }
                    }
                }
            }


            if (nextLeave != null)
            {

                if (nextLeave.LeaveTypeId != LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault() && nextLeave.LeaveTypeId != LeaveTypeNames.ON_DUTY.ToInt32OrDefault() && nextLeave.TotalDaysTaken >= 2 && nextLeave.LeaveFrom.Day == leaveRequest.ToDate.AddDays(1).Day)
                {
                    response = new EmpLeaveResponse()
                    {
                        Response = false,
                        Message = string.Format("You should not apply for the <strong>{0}</strong> succeeding with any other leaves.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                    };
                }
                if (nextLeave.LeaveTypeId != LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault() && nextLeave.LeaveTypeId != LeaveTypeNames.ON_DUTY.ToInt32OrDefault() && nextLeave.TotalDaysTaken == 1 && totalDays >= 2 && nextLeave.LeaveFrom.Day == leaveRequest.ToDate.AddDays(1).Day)
                {
                    response = new EmpLeaveResponse()
                    {
                        Response = false,
                        Message = string.Format("You should not apply for the <strong>{0}</strong> succeeding with any other leaves.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                    };
                }
                DateTime NextHolidayCheck = publicHolidays.Where(x => x.Date == nextDay.Date).FirstOrDefault();
                if (nexttoNextLeave != null && NextHolidayCheck != DateTime.MinValue)
                {
                    if (nexttoNextLeave.LeaveTypeId != LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault() && nexttoNextLeave.LeaveTypeId != LeaveTypeNames.ON_DUTY.ToInt32OrDefault() && NextHolidayCheck.Day == leaveRequest.ToDate.AddDays(1).Day
                        && nexttoNextLeave.LeaveFrom.Day == leaveRequest.ToDate.AddDays(2).Day)
                    {
                        response = new EmpLeaveResponse()
                        {
                            Response = false,
                            Message = string.Format("You should not apply for the <strong>{0}</strong> succeeding with any other leaves.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                        };
                    }
                }
                //if (nextLeave.LeaveTypeId != LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault() && nextLeave.LeaveTypeId != LeaveTypeNames.ON_DUTY.ToInt32OrDefault() && nextLeave.LeaveFrom.Day == leaveRequest.ToDate.AddDays(2).Day && NextHolidayCheck != DateTime.MinValue)
                //{
                //    response = new EmpLeaveResponse()
                //    {
                //        Response = false,
                //        Message = string.Format("You should not apply for the <strong>{0}</strong> succeeding with any other leaves.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                //    };
                //}
            }
            return response;
        }
        private async Task<EmpLeaveResponse> ValidateCasualLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType, double totalDays)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, payrollPeriodStartDate, payrollPeriodEndDate, leaveType.ToInt32OrDefault());
            if (leaveRequest.LeaveType.UpperBound > 0 && totalDays > leaveRequest.LeaveType.UpperBound)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded.  Maximum usage was {1} days at a stretch.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.UpperBound)
                };
                return response;
            }

            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count() >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not consume more than {0} {1} requests in a Month.", leaveRequest.LeaveType.MaximumUsage, leaveType.GetCustomAttributeDescription())

                };
                return response;
            }

            response = await ValidatePrefixSuffixPolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, leaveType, totalDays);
            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }

        private async Task<EmpLeaveResponse> ValidateSessionBreakLeavePolicy(EmployeeLeave leaveRequest, LeaveTypeNames leaveType, double totalDays)
        {
            double leaveTotalDays = totalDays;
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            DateTime yearStartDate = leaveRequest.FromDate.StartOfYear();
            DateTime yearEndDate = leaveRequest.FromDate.EndOfYear();

            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, yearStartDate, yearEndDate, leaveType.ToInt32OrDefault());
            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count() >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not consume more than {0} {1} requests in a Year.", leaveRequest.LeaveType.MaximumUsage, leaveType.GetCustomAttributeDescription())

                };
                return response;
            }
            leaveTotalDays = totalDays + leavesApplied.Sum(x => x.TotalDaysTaken.ToDoubleOrDefault());
            if (leaveRequest.LeaveType != null && leaveRequest.LeaveType.UpperBound > 0 && leaveTotalDays > leaveRequest.LeaveType.UpperBound)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = $"You can not apply for the <strong>{leaveType.GetCustomAttributeDescription()}</strong> as the usage limit exceeded.  Maximum usage was {leaveRequest.LeaveType.UpperBound} days at a stretch or in breaks."
                };
                return response;
            }

            if (leaveRequest.LeaveType.LowerBound > 0 && totalDays < leaveRequest.LeaveType.LowerBound)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You must apply for the minimum of <strong>{0} days  at a stretch</strong> to consume the {1} leave.", leaveRequest.LeaveType.LowerBound, leaveType.GetCustomAttributeDescription())
                };
                return response;
            }

            if (leaveRequest.LeaveType.MaxConcecutiveDays > 0 && leaveTotalDays > leaveRequest.LeaveType.MaxConcecutiveDays)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = $"You can not apply for the <strong>{leaveType.GetCustomAttributeDescription()}</strong> as the Maximum Usage Limit exceeded.  Maximum usage limit is {leaveRequest.LeaveType.MaxConcecutiveDays} days at a stretch."
                };
                return response;
            }

            
            response = await ValidateCoolingPeriod(leaveRequest, leaveType, yearStartDate, yearEndDate);
            if (response != null) return response;
            response = await ValidatePrefixSuffixPolicy(leaveRequest, yearStartDate, yearEndDate, leaveType, totalDays);

            if (response != null) return response;

            response = new EmpLeaveResponse()
            {
                Response = true,
                Message = "OK"
            };
            return response;
        }

        private async Task<EmpLeaveResponse> ValidateCoolingPeriod(EmployeeLeave leaveRequest, LeaveTypeNames leaveType, DateTime startDate, DateTime endDate)
        {
            EmpLeaveResponse response = null;
            switch (leaveType)
            {
                case LeaveTypeNames.PRESENT:
                case LeaveTypeNames.LEAVE:
                case LeaveTypeNames.ON_DUTY:
                case LeaveTypeNames.MANUAL_PRESENT:
                case LeaveTypeNames.ABSENT:
                case LeaveTypeNames.CASUAL_LEAVE:
                case LeaveTypeNames.SICK_LEAVE:
                case LeaveTypeNames.MATERNITY_LEAVE:
                case LeaveTypeNames.MARRIAGE_LEAVE:
                case LeaveTypeNames.COVID_LEAVE:
                case LeaveTypeNames.BEREAVEMENT_LEAVE:
                case LeaveTypeNames.SUMMER_VACATION:
                case LeaveTypeNames.WINTER_VACATION:
                case LeaveTypeNames.PATERNITY_LEAVE:
                case LeaveTypeNames.EARNED_LEAVE:
                case LeaveTypeNames.SPECIAL_CASUAL_LEAVE:
                case LeaveTypeNames.SPECIAL_SICK_LEAVE:
                case LeaveTypeNames.COMPENSATORY_OFF:
                case LeaveTypeNames.EARLY_LOGOUT_TIME:
                    response = new EmpLeaveResponse()
                    {
                        Response = true,
                        Message = "OK"
                    };
                    break;
                case LeaveTypeNames.SESSION_BREAK:

                    List<LeaveDetail> leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, startDate, endDate, leaveType.ToInt32OrDefault());
                    LeaveDetail firstAppliedDate = leavesApplied.FirstOrDefault();
                    if (firstAppliedDate != null)
                    {
                        DateTime nextCoolingPeriodStatDate = firstAppliedDate.LeaveFrom.AddMonths(ApplicationSettings.Current.CoolingPeriod).AddDays(1);
                        LeaveDetail lastLeaveApplied = leavesApplied.LastOrDefault();
                        if (nextCoolingPeriodStatDate <= leaveRequest.FromDate)
                        {
                            response = new EmpLeaveResponse()
                            {
                                Response = true,
                                Message = "OK"
                            };
                        }
                        else
                        {
                            response = new EmpLeaveResponse()
                            {
                                Response = false,
                                Message = string.Format(
                                    "You should wait for {0} month(s) to apply for the <strong>{1}</strong>.",
                                    ApplicationSettings.Current.CoolingPeriod,
                                    leaveType.GetCustomAttributeDescription())
                            };
                        }
                    }
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(leaveType), leaveType, null);
            }

            return response;
        }

        private async Task<EmpLeaveResponse> ValidatePrivilegeLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, double totalDays, LeaveTypeNames leaveType)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> yearLeavesApplied = null;
            if (leaveRequest.LeaveType.LowerBound > 0 && (totalDays) < leaveRequest.LeaveType.LowerBound) //Minimum Three (3) days should be applied.
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You should not apply for the <strong>{0}</strong> less than {1} days.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.LowerBound)
                };
                return response;
            }
            DateTime yearStart = leaveRequest.FromDate.StartOfYear();
            DateTime yearEnd = leaveRequest.ToDate.EndOfYear();

            yearLeavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, yearStart, yearEnd, leaveType.ToInt32OrDefault());

            if (leaveRequest.LeaveType.MaximumUsage > 0 && yearLeavesApplied.Count() >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not consume more than {0} {1} requests in a Year.", leaveRequest.LeaveType.LowerBound, leaveType.GetCustomAttributeDescription())
                };
                return response;
            }
            response = await ValidatePrefixSuffixPolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, leaveType, totalDays);

            // totalDays = leaveAppliedDates.Count;
            //beforeLeaves = await GetEmployeeLeavesBeforeStartDate(leaveRequest.EmployeeSlno, previousDay);
            //afterLeaves = await GetEmployeeLeavesAfterEndDate(leaveRequest.EmployeeSlno, nextDay);
            //LeaveDetail previousLeave = beforeLeaves.OrderByDescending(x => x.LeaveTo).FirstOrDefault();
            //LeaveDetail nextLeave = afterLeaves.OrderBy(x => x.LeaveFrom).FirstOrDefault();

            //if (previousLeave != null)
            //{
            //    if (previousLeave.LeaveTypeId != LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault() && previousLeave.LeaveTo.Day == leaveRequest.FromDate.AddDays(-1).Day)
            //    {
            //        response = new EmpLeaveResponse()
            //        {
            //            Response = false,
            //            Message = string.Format("You should not apply for the <strong>{0}</strong>  preceding with any other leaves except Sick leave.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
            //        };
            //        return response;
            //    }
            //}

            //if (nextLeave != null)
            //{
            //    if (nextLeave.LeaveTypeId != LeaveTypeNames.SICK_LEAVE.ToInt32OrDefault() && nextLeave.LeaveFrom == leaveRequest.ToDate.AddDays(1))
            //    {
            //        response = new EmpLeaveResponse()
            //        {
            //            Response = false,
            //            Message = string.Format("You should not apply for the <strong>{0}</strong>  succeeding with any other leaves except Sick leave.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
            //        };
            //        return response;
            //    }
            //}
            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }
        private async Task<EmpLeaveResponse> ValidatePaternityLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType, double totalDays)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> checkleavesApplied = null;
            DateTime startDate = leaveRequest.FromDate;
            DateTime endDate = leaveRequest.ToDate;
            var dateRanges = startDate.GetDateRange(endDate).ToList();
            checkleavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, null, null, leaveType.ToInt32OrDefault());
            if (leaveRequest.LeaveType.MaximumUsage > 0 && checkleavesApplied.Count >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded.  Maximum usage was {1} times.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                };
                return response;
            }

            response = await ValidatePrefixSuffixPolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, leaveType, totalDays);

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }
        private async Task<EmpLeaveResponse> ValidateMaternityLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType, double totalDays)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> checkleavesApplied = null;

            DateTime startDate = leaveRequest.FromDate;
            DateTime endDate = leaveRequest.ToDate;

            checkleavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, null, null, leaveType.ToInt32OrDefault());
            if (leaveRequest.LeaveType.MaximumUsage > 0 && checkleavesApplied.Count >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded. Maximum usage was {1} times.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                };
                return response;
            }

            response = await ValidatePrefixSuffixPolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, leaveType, totalDays);

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }

        private async Task<EmpLeaveResponse> ValidateSpecialSickLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            DateTime startDate = leaveRequest.FromDate;
            DateTime endDate = leaveRequest.ToDate;
            var dateRanges = startDate.GetDateRange(endDate).ToList();

            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, null, null, leaveType.ToInt32OrDefault());

            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded. Maximum usage was {1} times.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                };
                return response;
            }

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }

        private async Task<EmpLeaveResponse> ValidateSpecialCasualLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType, double totalDays)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            DateTime startDate = leaveRequest.FromDate;
            DateTime endDate = leaveRequest.ToDate;
            var dateRanges = startDate.GetDateRange(endDate).ToList();

            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, null, null, leaveType.ToInt32OrDefault());

            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded. Maximum usage was {1} times.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                };
                return response;
            }
            response = await ValidatePrefixSuffixPolicy(leaveRequest, payrollPeriodStartDate, payrollPeriodEndDate, leaveType, totalDays);

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }
        private async Task<EmpLeaveResponse> ValidateBereavementLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            DateTime startDate = leaveRequest.FromDate;
            DateTime endDate = leaveRequest.ToDate;
            var dateRanges = startDate.GetDateRange(endDate).ToList();

            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, null, null, leaveType.ToInt32OrDefault());

            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded. Maximum usage was {1} times.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                };
                return response;
            }

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }

        private async Task<EmpLeaveResponse> ValidateMarriageLeavePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            DateTime startDate = leaveRequest.FromDate;
            DateTime endDate = leaveRequest.ToDate;
            var dateRanges = startDate.GetDateRange(endDate).ToList();

            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, null, null, leaveType.ToInt32OrDefault());

            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded. Maximum usage was {1} times.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                };
                return response;
            }

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }
        private async Task<EmpLeaveResponse> ValidateEarlyLogoutTimePolicy(EmployeeLeave leaveRequest, DateTime payrollPeriodStartDate, DateTime payrollPeriodEndDate, LeaveTypeNames leaveType)
        {
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, payrollPeriodStartDate, payrollPeriodEndDate, leaveType.ToInt32OrDefault());
            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not apply for the <strong>{0}</strong> as the usage limit exceeded.  Maximum usage was {1} times in a payroll month.", leaveType.GetCustomAttributeDescription(), leaveRequest.LeaveType.MaximumUsage)
                };
                return response;
            }

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }

        private async Task<EmpLeaveResponse> ValidateSummerVacation(EmployeeLeave leaveRequest, double totalDays)
        {
            //EmpLeaveResponse response = null;

            //int UsedLeaveCount = 0;

            //UsedLeaveCount = await CheckForLeaveCountBetweenwDates(leaveRequest, leaveRequest.EmployeeSlno, LeaveTypeNames.SUMMER_VACATION.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());

            //if (UsedLeaveCount >= 2)
            //{
            //    response = new EmpLeaveResponse()
            //    {
            //        Response = false,
            //        Message = "Sorry, you donot apply Summer Vacation leaves more than 2 times."
            //    };
            //    return response;
            //}

            //if (leaveRequest.LeaveType.LeaveBalance < totalDays)
            //{
            //    response = new EmpLeaveResponse()
            //    {
            //        Response = false,
            //        Message = "Sorry, you donot have enough leave balance."
            //    };
            //    return response;
            //}

            //if (response == null)
            //{
            //    response = new EmpLeaveResponse()
            //    {
            //        Response = true,
            //        Message = "OK"
            //    };

            //}
            //return response;
            double leaveTotalDays = totalDays;
            EmpLeaveResponse response = null;
            List<LeaveDetail> leavesApplied = null;
            DateTime yearStartDate = leaveRequest.FromDate.StartOfYear();
            DateTime yearEndDate = leaveRequest.FromDate.EndOfYear();
            LeaveTypeNames leaveType = (LeaveTypeNames)leaveRequest.LeaveType.LeaveTypeId;

            leavesApplied = await GetEmployeeLeavesByLeaveType(leaveRequest.EmployeeSlno, yearStartDate, yearEndDate, leaveType.ToInt32OrDefault());
            if (leaveRequest.LeaveType.MaximumUsage > 0 && leavesApplied.Count() >= leaveRequest.LeaveType.MaximumUsage)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You can not consume more than {0} {1} requests in a Year.", leaveRequest.LeaveType.MaximumUsage, leaveType.GetCustomAttributeDescription())

                };
                return response;
            }
            leaveTotalDays = totalDays + leavesApplied.Sum(x => x.TotalDaysTaken.ToDoubleOrDefault());
            if (leaveRequest.LeaveType != null && leaveRequest.LeaveType.UpperBound > 0 && leaveTotalDays > leaveRequest.LeaveType.UpperBound)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = $"You can not apply for the <strong>{leaveType.GetCustomAttributeDescription()}</strong> as the usage limit exceeded.  Maximum usage was {leaveRequest.LeaveType.UpperBound} days at a stretch or in breaks."
                };
                return response;
            }

            if (leaveRequest.LeaveType.LowerBound > 0 && leaveRequest.LeaveType.LowerBound > totalDays)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = string.Format("You must apply for the minimum of <strong>{0} days  at a stretch</strong> to consume the {1} leave.", leaveRequest.LeaveType.LowerBound, leaveType.GetCustomAttributeDescription())
                };
                return response;
            }

            if (leaveRequest.LeaveType.MaxConcecutiveDays > 0 && leaveTotalDays > leaveRequest.LeaveType.MaxConcecutiveDays)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = $"You can not apply for the <strong>{leaveType.GetCustomAttributeDescription()}</strong> as the Maximum Usage Limit exceeded.  Maximum usage limit is {leaveRequest.LeaveType.MaxConcecutiveDays} days at a stretch."
                };
                return response;
            }


            response = await ValidateCoolingPeriod(leaveRequest, leaveType, yearStartDate, yearEndDate);
            if (response != null) return response;
            response = await ValidatePrefixSuffixPolicy(leaveRequest, yearStartDate, yearEndDate, leaveType, totalDays);

            if (response != null) return response;

            response = new EmpLeaveResponse()
            {
                Response = true,
                Message = "OK"
            };
            return response;
        }
        private async Task<EmpLeaveResponse> ValidateWinterVacation(EmployeeLeave leaveRequest, double totalDays)
        {

            EmpLeaveResponse response = null;

            int UsedLeaveCount = 0;

            UsedLeaveCount = await CheckForLeaveCountBetweenwDates(leaveRequest, leaveRequest.EmployeeSlno, LeaveTypeNames.WINTER_VACATION.ToInt32OrDefault(), LeaveStatusNames.PendingAndApproval.ToInt32OrDefault());

            if (UsedLeaveCount >= 2)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = "Sorry, you donot apply Summer Vacation leaves more than 2 times."
                };
                return response;
            }

            if (leaveRequest.LeaveType.LeaveBalance < totalDays)
            {
                response = new EmpLeaveResponse()
                {
                    Response = false,
                    Message = "Sorry, you donot have enough leave balance."
                };
                return response;
            }

            if (response == null)
            {
                response = new EmpLeaveResponse()
                {
                    Response = true,
                    Message = "OK"
                };

            }
            return response;
        }

        private async Task<int> CheckForLeaveCountBetweenwDates(EmployeeLeave leaveRequest, int employeeSlno, int leaveTypeId, int leaveStatusId)
        {
            int leaveCount = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_TYPE_ID", leaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_STATUS_ID", leaveStatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IDATEVALIDFROM", leaveRequest.LeaveType.DateValidFrom, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "IDATEVALIDUNTIL", leaveRequest.LeaveType.DateValidUntil, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "OLEAVECOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                await connection.ExecuteAsync(DatabaseProcedures.SP_CHECK_FOR_LEAVES_BTW_DATES, parameters, commandType: CommandType.StoredProcedure);
                leaveCount = parameters.Get<int>("OLEAVECOUNT");
            }

            return leaveCount;
        }

        //private EmpLeaveResponse CheckForHalfDayLeave(EmployeeLeave leaveRequest, LeaveTypeNames leaveType)
        //{
        //    EmpLeaveResponse response = null;
        //    if (!leaveRequest.LeaveType.CanApplyHalfDay)
        //    {
        //        if ((leaveRequest.FromDateDayTypeId == LeaveDayTypeNames.FirstHalf.ToInt32OrDefault() || leaveRequest.FromDateDayTypeId == LeaveDayTypeNames.SecondHalf.ToInt32OrDefault() ||
        //            leaveRequest.ToDateDayTypeId == LeaveDayTypeNames.FirstHalf.ToInt32OrDefault() || leaveRequest.ToDateDayTypeId == LeaveDayTypeNames.SecondHalf.ToInt32OrDefault()))
        //        {
        //            response = new EmpLeaveResponse()
        //            {
        //                Response = false,
        //                Message = string.Format("You can not consume a Half day leave for <strong>{0}</strong>.", leaveType.GetCustomAttributeDescription())
        //            };
        //        }
        //    }

        //    return response;
        //}
        //private List<DateTime> GetLeaveAppliedDates(EmployeeLeave leaveRequest, List<DateTime> leaveDates, List<DateTime> weekEnds, List<DateTime> holidays, List<DateTime> publicHolidays)
        //{
        //    List<DateTime> dates = null;
        //    LeaveTypeNames leaveType = (LeaveTypeNames)leaveRequest.LeaveType.LeaveTypeId;
        //    dates = new List<DateTime>();
        //    switch (leaveType)
        //    {
        //        case LeaveTypeNames.CASUAL_LEAVE:
        //            dates.AddRange(leaveDates);
        //            dates.AddRange(weekEnds);
        //            dates.AddRange(holidays);
        //            dates = dates.OrderBy(x => x.Date).ToList();
        //            DateTime previousDate = leaveRequest.FromDate.AddDays(-1);
        //            DateTime nextDate = leaveRequest.ToDate.AddDays(1);
        //            //Week Ends
        //            if (previousDate.IsSingleWeekEnd())
        //            {
        //                dates.Add(previousDate);
        //            }
        //            if (nextDate.IsSingleWeekEnd())
        //            {
        //                dates.Add(nextDate);
        //            }
        //            //Holidays
        //            if (publicHolidays.Contains(previousDate))
        //            {
        //                dates.Add(previousDate);
        //            }
        //            if (publicHolidays.Contains(nextDate))
        //            {
        //                dates.Add(nextDate);
        //            }
        //            break;
        //        case LeaveTypeNames.SICK_LEAVE:
        //            dates.AddRange(leaveDates);
        //            dates.AddRange(weekEnds);
        //            dates.AddRange(holidays);
        //            dates = dates.OrderBy(x => x.Date).ToList();
        //            break;
        //        case LeaveTypeNames.EARNED_LEAVE:
        //            break;
        //        default:
        //            break;
        //    }
        //    return dates;
        //}
        private async Task<List<DateTime>> GetOrganizationHolidays(int employeeSlno, DateTime dateLeaveFrom)
        {
            List<DateTime> publicHolidays = null;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parametersHoliday = new OracleDynamicParameters();
                parametersHoliday.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                parametersHoliday.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                IEnumerable<HolidayInformation> holidaysList = (await connection.QueryAsync<HolidayInformation>(DatabaseProcedures.P_GET_PORTAL_HOLIDAYS, parametersHoliday, commandType: CommandType.StoredProcedure)).ToList();
                publicHolidays = holidaysList.Where(x => x.HolidayDate >= dateLeaveFrom).Select(x => x.HolidayDate).ToList();
            }

            return publicHolidays;
        }
        private EmpLeaveResponse CheckForOverLappingPeriods(List<DateTime> appliedDates, EmployeeLeave leaveRequest, List<LeaveDetail> appliedLeaves)
        {
            EmpLeaveResponse errorMessage;
            ITimePeriodCollection overLappingPeriods = CheckForOverLappingDaysForAppliedLeave(appliedDates, leaveRequest, appliedLeaves);
            if (overLappingPeriods.Count > 0)
            {
                errorMessage = new EmpLeaveResponse
                {
                    Response = false,
                    Message = "There are some overlapping leaves applied.  Please validate and re-apply."
                };
            }
            else
            {
                errorMessage = new EmpLeaveResponse
                {
                    Response = true,
                    Message = "OK"
                };
            }
            return errorMessage;
        }
        private List<int> CheckForOverLappingDayTypeForAppliedLeave(ITimePeriodCollection overlapPeriods, EmployeeLeave leaveRequest, List<LeaveDetail> appliedLeaves)
        {
            List<int> lastAppliedLeaves2 = new List<int>();
            List<int> data = null;
            List<LeaveDetail> lastAppliedLeaves = new List<LeaveDetail>();
            var overlappingLeaves = appliedLeaves.Where(appliedLeave => overlapPeriods.Any(date => (appliedLeave.LeaveFrom == date.Start || appliedLeave.LeaveTo == date.End))).ToList();
            //var overlappingLeaves = overlapPeriods.Where(date => appliedLeaves.Any(appliedLeave => (appliedLeave.LeaveFrom == date.Start || appliedLeave.LeaveTo == date.End))).ToList();

            foreach (var dateTime in overlappingLeaves)
            {
                if (dateTime.LeaveFrom.Date == leaveRequest.FromDate.Date)
                {
                    if (
  (dateTime.FromDateDayTypeId == 2 && leaveRequest.FromDateDayTypeId == 3) ||
  (dateTime.FromDateDayTypeId == 3 && leaveRequest.FromDateDayTypeId == 2))
                    {
                        // Allow the request
                        //lastAppliedLeaves2.Add(dateTime.LeaveId);
                        var groupedLeaveFroms = overlappingLeaves.Where(s => s.LeaveFrom == leaveRequest.FromDate).ToList();
                        if (groupedLeaveFroms.Count < 2)
                        {
                            lastAppliedLeaves2.Add(dateTime.LeaveId);
                        }
                    }
                }
                if (dateTime.LeaveFrom.Date == leaveRequest.ToDate.Date)
                {
                    if (
  (dateTime.FromDateDayTypeId == 2 && leaveRequest.ToDateDayTypeId == 3) ||
  (dateTime.FromDateDayTypeId == 3 && leaveRequest.ToDateDayTypeId == 2))
                    {
                        // Allow the request
                        // lastAppliedLeaves2.Add(dateTime.LeaveId);
                        var groupedLeaveFroms = overlappingLeaves.Where(s => s.LeaveFrom == leaveRequest.ToDate).ToList();
                        if (groupedLeaveFroms.Count < 2)
                        {
                            lastAppliedLeaves2.Add(dateTime.LeaveId);
                        }
                    }
                }
                if (dateTime.LeaveTo.Date == leaveRequest.FromDate.Date)
                {
                    if (
  (dateTime.ToDateDayTypeId == 2 && leaveRequest.FromDateDayTypeId == 3) ||
  (dateTime.ToDateDayTypeId == 3 && leaveRequest.FromDateDayTypeId == 2))
                    {
                        // Allow the request
                        // lastAppliedLeaves2.Add(dateTime.LeaveId);
                        var groupedLeaveFroms = overlappingLeaves.Where(s => s.LeaveTo == leaveRequest.FromDate).ToList();
                        if (groupedLeaveFroms.Count < 2)
                        {
                            lastAppliedLeaves2.Add(dateTime.LeaveId);
                        }
                    }
                }
                if (dateTime.LeaveTo.Date == leaveRequest.ToDate.Date)
                {
                    if (
  (dateTime.ToDateDayTypeId == 2 && leaveRequest.ToDateDayTypeId == 3) ||
  (dateTime.ToDateDayTypeId == 3 && leaveRequest.ToDateDayTypeId == 2))
                    {
                        // Allow the request
                        //  lastAppliedLeaves2.Add(dateTime.LeaveId);
                        var groupedLeaveFroms = overlappingLeaves.Where(s => s.LeaveTo == leaveRequest.ToDate).ToList();
                        if (groupedLeaveFroms.Count < 2)
                        {
                            lastAppliedLeaves2.Add(dateTime.LeaveId);
                        }
                    }
                }
            }
            return lastAppliedLeaves2;

        }
        private ITimePeriodCollection CheckForOverLappingDaysForAppliedLeave(List<DateTime> appliedDates, EmployeeLeave leaveRequest, List<LeaveDetail> appliedLeaves)
        {
            ITimePeriodCollection overlapPeriods = null;
            ITimePeriodCollection overlapPeriods2 = null;

            TimePeriodCollection leaveAppliedTimePeriods = new TimePeriodCollection();
            TimePeriodCollection leaveAppliedTimePeriods2 = new TimePeriodCollection();

            overlapPeriods = new TimePeriodCollection();
            overlapPeriods2 = new TimePeriodCollection();

            List<DateTime> lastAppliedLeaves = new List<DateTime>();
            List<DateTime> lastAppliedLeaves2 = new List<DateTime>();


            TimePeriodCollection periodsToCheck = new TimePeriodCollection { new TimeRange(leaveRequest.FromDate, leaveRequest.ToDate) };
            foreach (var dateTime in appliedLeaves)
            {
                lastAppliedLeaves.AddRange(dateTime.LeaveFrom.GetDateRange(dateTime.LeaveTo).ToList());
                lastAppliedLeaves2.AddRange(dateTime.LeaveFrom.GetDateRange(dateTime.LeaveFrom).ToList());
                if (dateTime.LeaveFrom != dateTime.LeaveTo)
                {
                    lastAppliedLeaves2.AddRange(dateTime.LeaveTo.GetDateRange(dateTime.LeaveTo).ToList());

                }
            }

            foreach (var dateRange in lastAppliedLeaves)
            {
                leaveAppliedTimePeriods.Add(new TimeRange(dateRange.Date, dateRange.Date));
            }
            foreach (var dateRange in lastAppliedLeaves2)
            {
                leaveAppliedTimePeriods2.Add(new TimeRange(dateRange.Date, dateRange.Date));
            }
            foreach (DateTime item in appliedDates)
            {
                overlapPeriods = leaveAppliedTimePeriods.OverlapPeriods(new TimeRange(item.Date, item.Date));
                overlapPeriods2 = leaveAppliedTimePeriods2.OverlapPeriods(new TimeRange(item.Date, item.Date));
                if (overlapPeriods2.Count > 0)
                {
                    var data = CheckForOverLappingDayTypeForAppliedLeave(overlapPeriods2, leaveRequest, appliedLeaves);
                    if (data != null && data.Count > 0)
                    {
                        return overlapPeriods = new TimePeriodCollection();
                    }
                }
                if (overlapPeriods.Count > 0)
                {
                    return overlapPeriods;
                }
            }
            return overlapPeriods;
        }
        private async Task UpdateConsumedLeaves(IDbConnection connection, EmployeeLeave empLeaveRequest, double totalDays)
        {
            OracleDynamicParameters parameters = new OracleDynamicParameters();
            parameters.Add(name: "iEMPLOYEE_LEAVE_ENTITLEMENT_ID", empLeaveRequest.LeaveType.EntitlementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parameters.Add(name: "iEMPLOYEESLNO", empLeaveRequest.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parameters.Add(name: "iCONSUMED_LEAVES", totalDays, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
            await connection.ExecuteAsync(DatabaseProcedures.SP_EMP_UPDATE_CONSUMED_LEAVES, parameters, commandType: CommandType.StoredProcedure);
        }
        private async Task UploadLeaveFile(EmployeeLeave employeeLeave, int leaveId, IDbConnection connection)
        {
            List<OracleDynamicParameters> parmeters = new();
            bool fileResp = await UploadLeaveFileToDirectory(employeeLeave.LeaveFileUploads, leaveId);
            if (fileResp)
            {
                employeeLeave.LeaveFileUploads.ForEach(file =>
                {
                    var param = new OracleDynamicParameters();
                    param.Add(name: "iEMPLOYEE_LEAVE_ID", leaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iFILE_NAME", file.FileToUpload.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME_ORIGINAL", file.FileName_Original, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILEPATH", file.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(param);
                });
            }
            await connection.ExecuteAsync(DatabaseProcedures.SP_EMP_LEAVE_FILEUPLOAD, parmeters, commandType: CommandType.StoredProcedure);
        }
        private async Task<bool> UploadLeaveFileToDirectory(List<LeaveFileUpload> leaveFileUploads, int leaveId)
        {
            foreach (var leaveFile in leaveFileUploads)
            {
                if (leaveFile != null)
                {
                    string path = Path.Combine(ApplicationSettings.Current.LeaveFilePath);
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    string fileType = Path.GetExtension(leaveFile.FileToUpload.FileName).ToString().ToLower();
                    string fileName = string.Format("{0}{1}{2}", leaveId, DateTime.Now.Ticks, fileType);
                    path = Path.Combine(path, fileName);

                    if (!File.Exists(path))
                    {
                        string base64String = leaveFile.FileToUpload.FileAsBase64.Substring(leaveFile.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                        byte[] imageBytes = Convert.FromBase64String(base64String);
                        File.WriteAllBytes(path, imageBytes);
                        leaveFile.FileName_Original = leaveFile.FileToUpload.FileName;
                        leaveFile.FilePath = path;
                        leaveFile.FileToUpload.FileName = fileName;
                    }
                }
            }

            return true;
        }
        public async Task<int> GetUtilizedOnDuties(int employeeSlno)
        {
            int utilizedOnDuties = 0;
            DateTime startDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month - 1, ApplicationSettings.Current.PayrollPeriodStart).StartOfDay();
            DateTime endDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, ApplicationSettings.Current.PayrollPeriodEnd).EndOfDay();
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iSTART_DATE", startDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iEND_DATE", endDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "OUTILIZED_ONDUTIES", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                await connection.ExecuteAsync(DatabaseProcedures.SP_GET_UTILIZED_ONDUTIES, parameters, commandType: CommandType.StoredProcedure);
                utilizedOnDuties = parameters.Get<int>("OUTILIZED_ONDUTIES");
            }

            return utilizedOnDuties;
        }
        public async Task<List<EmpLeaveFileDetails>> GetEmpLeaveFiles(int leaveId)
        {
            List<EmpLeaveFileDetails> empLeaveFileDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEE_LEAVE_ID", leaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaveFileDetails = (await connection.QueryAsync<EmpLeaveFileDetails>(DatabaseProcedures.SP_GET_EMP_LEAVE_FILE_DETAILS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return empLeaveFileDetails;
        }
        public async Task<List<LeaveBalance>> GetLeaveBalancesReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<LeaveBalance> employeeLeaveEntitlements = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iBRANCHSLNO", searchCriteria.BranchSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, searchCriteria.BranchSlno.Count,
                                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                IEnumerable<LeaveBalance> entitlements = await connection.QueryAsync<LeaveBalance>(DatabaseProcedures.SP_EMPLOYEE_LEAVE_BALANCE, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaveEntitlements = entitlements.ToList();
            }
            return employeeLeaveEntitlements;
        }

        public async Task<List<EmployeeLeaveReport>> GetEmployeeLeaveReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<EmployeeLeaveReport> employeeLeaveEntitlements = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iBRANCHSLNO", searchCriteria.BranchSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, searchCriteria.BranchSlno.Count,
                                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iFROM_DATE", searchCriteria.ReportRange[0], dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "iTO_DATE", searchCriteria.ReportRange[1], dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                IEnumerable<EmployeeLeaveReport> entitlements = await connection.QueryAsync<EmployeeLeaveReport>(DatabaseProcedures.SP_EMPLOYEE_LEAVE_REPORT, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaveEntitlements = entitlements.ToList();
            }
            return employeeLeaveEntitlements;
        }
        public async Task<List<LeaveEntitlementReport>> GetLeaveEntitlementReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<LeaveEntitlementReport> employeeLeaveEntitlements = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iBRANCHSLNO", searchCriteria.BranchSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, searchCriteria.BranchSlno.Count,
                                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //parameters.Add(name: "iFROM_DATE", searchCriteria.ReportRange[0], dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                //parameters.Add(name: "iTO_DATE", searchCriteria.ReportRange[1], dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                IEnumerable<LeaveEntitlementReport> entitlements = await connection.QueryAsync<LeaveEntitlementReport>(DatabaseProcedures.SP_EMPLOYEE_LEAVE_ENTITLEMENTS, parameters, commandType: CommandType.StoredProcedure);
                employeeLeaveEntitlements = entitlements.ToList();
            }
            return employeeLeaveEntitlements;
        }
    }
}