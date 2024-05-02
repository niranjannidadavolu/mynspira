using Phoenix.Model.Business.LeaveAutoApproval;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Hubs
{
    public interface IAutoApproval
    {
        Task DisplayMessage(string message);
        Task UpdateProgressBar(int percentage);
        Task DisplayProgressMessage(string message);
        Task ShowNotifications(List<AutoApprovalDetails> autoapprovals);
    }
}
