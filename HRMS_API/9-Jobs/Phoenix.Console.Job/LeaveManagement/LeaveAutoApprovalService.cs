using Phoenix.Application.LeaveAutoApproval.Interfaces;
using Phoenix.Model.Business.LeaveAutoApproval;

namespace Phoenix.Console.Job.LeaveManagement
{
    public class LeaveAutoApprovalService: ILeaveAutoApprovalService
    {
    
        private readonly ILeaveAutoApprovalApplication leaveautoapprovals;

        public LeaveAutoApprovalService(ILeaveAutoApprovalApplication leaveautoapprovals)
        {
            this.leaveautoapprovals = leaveautoapprovals;
        }

        public async Task GetAutoApprovals()
        {
            //List<AutoApprovalDetails> autoapproval = new List<AutoApprovalDetails>();
            //autoapproval = leaveautoapprovals.LeaveAutoApprovals();
        }

    }
}
