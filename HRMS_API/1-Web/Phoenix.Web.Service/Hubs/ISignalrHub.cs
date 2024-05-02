using System.Collections.Generic;
using System.Threading.Tasks;

using Phoenix.Model.Business.Notification;

namespace Phoenix.Web.Service.Hubs
{
    public interface ISignalrHub
    {
        Task DisplayMessage(string message);
        Task UpdateProgressBar(int percentage);
        Task DisplayProgressMessage(string message);
        Task ShowNotifications(List<NotificationDetail> notifications);
        Task GetVisitorCount();
    }
}
