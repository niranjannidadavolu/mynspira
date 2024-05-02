using Phoenix.Model.Business.Notification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Notification.Interfaces
{
    public interface INotificationDomain
    {
        Task<List<NotificationDetail>> GetNotifications(int districtSlNo);
    }
}
