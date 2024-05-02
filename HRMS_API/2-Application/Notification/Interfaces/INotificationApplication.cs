using Phoenix.Model.Business.Notification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Notification.Interfaces
{
    public interface INotificationApplication
    {
        Task<List<NotificationDetail>> GetNotifications(int employeeSlno);
    }
}
