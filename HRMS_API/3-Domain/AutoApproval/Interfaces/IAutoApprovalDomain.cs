using Phoenix.Model.Business.LeaveAutoApproval;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.AutoApproval.Interfaces
{
    public interface IAutoApprovalDomain
    {
        Task GetAutoApprovals();
    }
}
