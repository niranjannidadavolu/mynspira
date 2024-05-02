using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.SiteNotification;
using System.Threading.Tasks;

namespace Phoenix.Application.SiteNotification.Interfaces
{
    public interface ISiteNotificationApplication
    {
        Task<SiteNotificationDetails> GetSiteNotifications(int officeTypeslno);

        Task<EmpLeaveResponse> SaveEmployeeFeedback(EmployeeFeedbackDetails empFeedbackRequest);
    }
}
