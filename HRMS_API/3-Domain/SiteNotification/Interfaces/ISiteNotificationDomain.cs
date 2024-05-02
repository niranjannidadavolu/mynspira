using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.Notification;
using Phoenix.Model.Business.SiteNotification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.SiteNotification.Interfaces
{
    public interface ISiteNotificationDomain
    {
        Task<SiteNotificationDetails> GetSiteNotifications(int officeTypeslno);
        Task<EmpLeaveResponse> SaveEmployeeFeedback(EmployeeFeedbackDetails empFeedbackRequest);
    }
}
