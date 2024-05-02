using Phoenix.Application.Notification.Interfaces;
using Phoenix.Domain.Notification.Interfaces;
using Phoenix.Model.Business.Notification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Notification.Implementations
{
    public class NotificationApplication : INotificationApplication
    {
        private readonly INotificationDomain NotificationDomain;
        public NotificationApplication(INotificationDomain NotificationDomain)
        {
            this.NotificationDomain = NotificationDomain;
        }

        public async Task<List<NotificationDetail>> GetNotifications(int employeeSlno)
        {
            List<NotificationDetail> NotificationDetails = await NotificationDomain.GetNotifications(employeeSlno);
            return NotificationDetails;
        }
    }
}
