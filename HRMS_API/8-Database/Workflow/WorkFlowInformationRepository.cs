using Dapper.Oracle;
using Dapper;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.WorkFlow;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Workflow
{
    public class WorkFlowInformationRepository : BaseRepository
    {
        private readonly IDbConnection localConnection;
        private readonly IConfiguration configuration;

        public WorkFlowInformationRepository(IConfiguration configuration) : base(configuration)
        {
        }
        public WorkFlowInformationRepository(IDbConnection connection, IConfiguration configuration) : base(configuration)
        {
            this.localConnection = connection;
            this.configuration = configuration;
        }
        public async Task<bool> InitiateLeaveWorkFlow(int employeeSlno, int leaveId, EmployeeLeave leaveRequest)
        {
            //TODO: Get The Workflow for leave.
            bool isWorkFlowSaved = false;
            WorkFlowType leaveWorkFlowType = WorkFlowType.Leave;
            List<WorkFlowInformation> mappedWorkflows = await GetEmployeeWorkFlows(employeeSlno, leaveWorkFlowType);
            mappedWorkflows = mappedWorkflows.OrderBy(x => x.StepMasterId).ToList();
            WorkFlowInformation workFlow = mappedWorkflows.FirstOrDefault();
            if (workFlow != null)
            {
                isWorkFlowSaved = await InsertLeaveWorkFlow(workFlow, leaveId);
            }
            //TODO: Create the objects for the WorkFlow
            //TODO: Save WorkFlow and Return the No of Records.

            return isWorkFlowSaved;
        }


        public async Task<bool> LeaveWorkFlowProcess(int employeeSlno, int leaveId, EmployeeLeave leaveRequest)
        {
            //TODO: Get The Workflow for leave.
            bool isWorkFlowSaved = false;
            WorkFlowType leaveWorkFlowType = WorkFlowType.Leave;
            List<WorkFlowInformation> mappedWorkflows = await GetEmployeeWorkFlows(employeeSlno, leaveWorkFlowType);
            mappedWorkflows = mappedWorkflows.OrderBy(x => x.StepMasterId).ToList();
            WorkFlowInformation workFlow = mappedWorkflows.FirstOrDefault();
            if (workFlow != null)
            {
                isWorkFlowSaved = await InsertLeaveWorkFlow(workFlow, leaveId);
            }
            //TODO: Create the objects for the WorkFlow
            //TODO: Save WorkFlow and Return the No of Records.

            return isWorkFlowSaved;
        }

        private async Task<bool> InsertLeaveWorkFlow(WorkFlowInformation workFlowInformation, int leaveId)
        {
            bool resp = false;
            OracleDynamicParameters param = new();
            param.Add(name: "ILEAVEID", leaveId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            param.Add(name: "IWORKFLOW_TYPE_ID", workFlowInformation.WorkFlowTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            param.Add(name: "ISTEP_TYPE_ID", workFlowInformation.StepTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            param.Add(name: "ISTEP_MASTER_ID", workFlowInformation.StepMasterId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            param.Add(name: "ILEAVE_STATUSID", LeaveStatusNames.PendingForApproval.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            param.Add(name: "IASSIGNED_TO", workFlowInformation.Reporting_EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);

            int updatedRecords = await localConnection.ExecuteAsync(DatabaseProcedures.INSERT_LEAVE_WORKFLOW, param, commandType: CommandType.StoredProcedure);
            resp = (updatedRecords * -1) > 0;
            //bool isSuccess = await SaveNotification(empLeaveRequest.EmployeeSlno, "");
            return resp;

        }

        private async Task<List<WorkFlowInformation>> GetEmployeeWorkFlows(int employeeSlno, WorkFlowType leaveWorkFlowType)
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
    }
}
