using Phoenix.Application.LeaveAutoApproval.Interfaces;
using Phoenix.Domain.AutoApproval.Interfaces;
using System.Threading.Tasks;

namespace Phoenix.Application.LeaveAutoApproval.Implementations
{
    public class AutoApprovalApplication : ILeaveAutoApprovalApplication
    {
        private readonly IAutoApprovalDomain AutoApprovalDomain;
        public AutoApprovalApplication(IAutoApprovalDomain AutoApprovalDomain)
        {
            this.AutoApprovalDomain = AutoApprovalDomain;
        }

    
        public async Task LeaveAutoApprovals()
        {
            await AutoApprovalDomain.GetAutoApprovals();
        }
    }
}
