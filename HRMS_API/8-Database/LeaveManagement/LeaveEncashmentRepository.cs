using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.WorkFlow;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.LeaveManagement
{
    public class LeaveEncashmentRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public LeaveEncashmentRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveEncashment>> GetLeaveEncashment(int employeeSlno)
        {
            List<LeaveEncashment> leavesInfo = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "IEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "DATACUR1", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                //  leavesInfo = (await connection.QueryAsync<LeaveEncashment>(DatabaseProcedures.SP_GET_LEAVE_ENCASHMENT, parameters, commandType: CommandType.StoredProcedure)).ToList();
                //  leavesInfo = leavesInfo.OrderByDescending(x => x.EncashmentId).ToList();
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_GET_LEAVE_ENCASHMENT, parameters, commandType: CommandType.StoredProcedure);
                leavesInfo = results.Read<LeaveEncashment>().ToList();
                var encashmentWorkFlows = results.Read<EncashmentWorkFlow>().ToList();

                foreach (var item in leavesInfo)
                {
                    item.EncashmentWorkFlows = encashmentWorkFlows.Where(x => x.EncashmentId == item.EncashmentId).ToList();
                }
                }
            return leavesInfo;
        }
      
        public async Task<bool> SaveLeaveEncashment(LeaveEncashmentReq employeeLeaveEncashmentReq)
        {
            bool resp = false;
            int updatedRecords = 0;
            bool isSaveWorkFlow = false;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                //WorkFlowType leaveWorkFlowType = WorkFlowType.Encashment;
                //List<WorkFlowInformation> mappedWorkflows = await GetEncashmentWorkFlows(employeeLeaveEncashmentReq.EmployeeSlno, leaveWorkFlowType);
                //mappedWorkflows = mappedWorkflows.OrderBy(x => x.StepMasterId).ToList();
                //WorkFlowInformation workFlow = mappedWorkflows.FirstOrDefault();
                //if (workFlow != null)
                //{
                    OracleDynamicParameters parameters = new OracleDynamicParameters();
                    parameters.Add(name: "iEMPLOYEESLNO", employeeLeaveEncashmentReq.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iBRANCH_SLNO", employeeLeaveEncashmentReq.BranchSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iEMP_SLNO", employeeLeaveEncashmentReq.EmpSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iUNIQUENO", employeeLeaveEncashmentReq.UniqueNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iFINSLNO", employeeLeaveEncashmentReq.FinSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTOTAL_DAYS_TAKEN", employeeLeaveEncashmentReq.TotalDaysTaken, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iENCASHMENT_AMOUNT", employeeLeaveEncashmentReq.EncashmentAmount, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTAXABLE_AMOUNT", employeeLeaveEncashmentReq.TaxbleAmount, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTOTAL_AMOUNT", employeeLeaveEncashmentReq.TotalAmount, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                    parameters.Add(name: "iREMARKS", employeeLeaveEncashmentReq.Remarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    //parameters.Add(name: "oEMPLOYEE_LEAVE_ENCASHMENT_ID", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                    //parameters.Add(name: "iWORKFLOW_TYPE_ID", workFlow.WorkFlowTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    //parameters.Add(name: "iSTEP_TYPE_ID", workFlow.StepTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    //parameters.Add(name: "iSTEP_MASTER_ID", workFlow.StepMasterId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iENCASHMENT_STATUSID", LeaveStatusNames.PendingForApproval.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    //parameters.Add(name: "iASSIGNED_TO", workFlow.Reporting_EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iENTITLEMENT_ID", employeeLeaveEncashmentReq.EntitlementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);

                    updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_INSERT_LEAVE_ENCASHMENT, parameters, commandType: CommandType.StoredProcedure);
                   // var parentId = parameters.Get<int>("oEMPLOYEE_LEAVE_ENCASHMENT_ID");
                //}
                //isSaveWorkFlow = await InitiateLeaveWorkFlow(employeeLeaveEncashmentReq.EmployeeSlno, parentId);
            }
            resp = updatedRecords * -1 > 0;
            return resp;
        }
     
        public async Task<bool> DeleteLeaveEncashment(DeleteEncashmentReq deleteEncashmentReq)
        {
            bool resp = false;
            int updatedRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iENCASHMENT_ID", deleteEncashmentReq.EncashmentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iUPDATEDBY", deleteEncashmentReq.UpdatedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iENTITLEMENT_ID", deleteEncashmentReq.EntitlementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iTOTAL_DAYS_TAKEN", deleteEncashmentReq.TotalDaysTaken, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);

                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_LEAVE_ENCASHMENT, parameters, commandType: CommandType.StoredProcedure);
            }
            resp = updatedRecords * -1 > 0;
            return resp;
        }
        public async Task<decimal> GetEmployeeTDSAmountDetails(EmployeeTDSMountDetails employeeTDSMountDetails)
        {
            decimal tdsAmount = 0;
            EmployeeTDSMountDetails tdsEmployeeDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMP_SLNO", employeeTDSMountDetails.EmpSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iUNIQUENO", employeeTDSMountDetails.Uniqueno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iBRANCH_SLNO", employeeTDSMountDetails.BranchSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", employeeTDSMountDetails.FinSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iAPPLIED_AMOUNT", employeeTDSMountDetails.AppliedAmount, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                //parmeters.Add(name: "oTDS_AMOUNT", employeeTDSMountDetails.otdsAmount, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "oTDS_AMOUNT", dbType: OracleMappingType.Decimal, direction: ParameterDirection.Output);
                tdsAmount = await connection.ExecuteScalarAsync<decimal>(DatabaseProcedures.GET_EMPLOYEE_TDS_AMOUNT, parmeters, commandType: CommandType.StoredProcedure);
            }

            return tdsAmount;
        }

        public async Task<bool> UpdateEmployeeEncashmentStatus(UpdateEncashmentReq leaveDetail)
        {
            bool resp = false;
            int updatedRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters param = new();
                param.Add(name: "iENCASHMENT_ID", leaveDetail.EncashmentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iSTATUS_ID", leaveDetail.LeaveStatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iEMPLOYEE_SLNO", leaveDetail.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iREMARKS", leaveDetail.ApprovedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.PROCESS_ENCASHMENT_WORKFLOW, param, commandType: CommandType.StoredProcedure);

                resp = (updatedRecords * -1) > 0;
            }

            return resp;

        }

        private async Task<List<WorkFlowInformation>> GetEncashmentWorkFlows(int employeeSlno, WorkFlowType leaveWorkFlowType)
        {
            List<WorkFlowInformation> workFlowInformation = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "IEMPLOYEE_SLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IWORKFLOW_TYPE_ID", leaveWorkFlowType.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                workFlowInformation = (await connection.QueryAsync<WorkFlowInformation>(DatabaseProcedures.GET_EMPLOYEE_WORKFLOW, parameters, commandType: CommandType.StoredProcedure)).ToList();

            }
            return workFlowInformation;
        }
        public async Task<List<LeaveEncashmentApprovalsDetails>> GetLeavesEncashmentApproval(int employeeSlno)
        {
            List<LeaveEncashmentApprovalsDetails> LeaveEncashmentApprovals = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iLEAVE_STATUS_ID", LeaveStatusNames.PendingForApproval.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                LeaveEncashmentApprovals = (await connection.QueryAsync<LeaveEncashmentApprovalsDetails>(DatabaseProcedures.GET_LEAVES_ENCASHMENT_APPROVAL, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return LeaveEncashmentApprovals;
        }

        //public async Task<bool> InitiateLeaveWorkFlow(int employeeSlno, int encashmentId)
        //{
        //    //TODO: Get The Workflow for leave.
        //    bool isWorkFlowSaved = false;
        //    WorkFlowType leaveWorkFlowType = WorkFlowType.Encashment;
        //    List<WorkFlowInformation> mappedWorkflows = await GetEncashmentWorkFlows(employeeSlno, leaveWorkFlowType);
        //    mappedWorkflows = mappedWorkflows.OrderBy(x => x.StepMasterId).ToList();
        //    WorkFlowInformation workFlow = mappedWorkflows.FirstOrDefault();
        //    if (workFlow != null)
        //    {
        //        isWorkFlowSaved = await InsertEncashmentWorkFlow(workFlow, encashmentId);
        //    }
        //    //TODO: Create the objects for the WorkFlow
        //    //TODO: Save WorkFlow and Return the No of Records.

        //    return isWorkFlowSaved;
        //}

        //private async Task<bool> InsertEncashmentWorkFlow(WorkFlowInformation workFlowInformation, int encashmentId)
        //{
        //    bool resp = false;
        //    int updatedRecords = 0;

        //    using (var connection = await CreateConnection(DbSchema.PORTAL))
        //    {
        //        OracleDynamicParameters param = new();
        //        param.Add(name: "IEMPLOYEE_LEAVE_ENCASHMENT_ID", encashmentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //        param.Add(name: "IWORKFLOW_TYPE_ID", workFlowInformation.WorkFlowTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //        param.Add(name: "ISTEP_TYPE_ID", workFlowInformation.StepTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //        param.Add(name: "ISTEP_MASTER_ID", workFlowInformation.StepMasterId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //        param.Add(name: "ILEAVE_STATUSID", LeaveStatusNames.PendingForApproval.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
        //        param.Add(name: "IASSIGNED_TO", workFlowInformation.Reporting_EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);

        //        updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.INSERT_LEAVE_WORKFLOW, param, commandType: CommandType.StoredProcedure);
        //    }
        //    resp = (updatedRecords * -1) > 0;
        //    return resp;

        //}
    }
}
