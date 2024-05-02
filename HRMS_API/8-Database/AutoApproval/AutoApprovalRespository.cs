using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Database.Repository.LeaveManagement;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.LeaveAutoApproval;
using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Logging;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.AutoApproval
{
    public class AutoApprovalRespository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;

        public AutoApprovalRespository(IConfiguration configuration, ILoggerManager logger) : base(configuration)
        {
            this.configuration = configuration;
            this.logger = logger;
        }

        public async Task GetAutoApprovals()
        {
            List<AutoApprovalDetails> autoapprovals = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                autoapprovals = (await connection.QueryAsync<AutoApprovalDetails>(DatabaseProcedures.GET_AUTO_APPROVALS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in autoapprovals)
            {
                LeaveDetail leaveDetail = new LeaveDetail();
                bool empLeaveStatus = false;
                using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
                {
                    leaveDetail.LeaveId = item.LeaveId;
                    leaveDetail.WorkFlowTypeId = item.WorkflowTypeId;
                    leaveDetail.StepTypeId = item.StepTypeId;
                    leaveDetail.StepMasterId = item.StepMasterId;
                    leaveDetail.LeaveStatusId = LeaveStatusNames.Approved.ToInt32OrDefault();
                    leaveDetail.EmployeeSlno = item.EmployeeSno;
                    leaveDetail.ApprovedRemarks = "AUTO APPROVED BY SYSTEM.";

                    leaveDetail.LeaveTo = item.LeaveTo;
                    leaveDetail.LeaveFrom = item.LeaveFrom;
                    leaveDetail.LeaveTypeId = item.LeaveTypeId;
                    empLeaveStatus = await leaveManagementRepository.UpdateEmployeeLeaveStatus(leaveDetail);
                }

            }
        }
    }
}
