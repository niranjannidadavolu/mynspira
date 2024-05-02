using Phoenix.Application.SiteNotification.Interfaces;
using Phoenix.Domain.SiteNotification.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.SiteNotification;
using System.Threading.Tasks;

namespace Phoenix.Application.SiteNotification.Implementations
{
    public class SiteNotificationApplication:ISiteNotificationApplication
    {
        private readonly ISiteNotificationDomain SiteNotificationDomain;
        public SiteNotificationApplication(ISiteNotificationDomain SiteNotificationDomain)
        {
            this.SiteNotificationDomain = SiteNotificationDomain;
        }

        public async Task<SiteNotificationDetails> GetSiteNotifications(int officeTypeslno)
        {
            SiteNotificationDetails SiteNotificationDetails = await SiteNotificationDomain.GetSiteNotifications(officeTypeslno);
            return SiteNotificationDetails;
        }

        public async Task<EmpLeaveResponse> SaveEmployeeFeedback(EmployeeFeedbackDetails empFeedbackRequest)
        {
            EmpLeaveResponse SaveEmployeeFeedback = await SiteNotificationDomain.SaveEmployeeFeedback(empFeedbackRequest);
            return SaveEmployeeFeedback;
        }
    }
}
