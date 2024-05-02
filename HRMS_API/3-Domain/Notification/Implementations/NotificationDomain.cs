using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Notificaton;
using Phoenix.Domain.Notification.Interfaces;
using Phoenix.Model.Business.Notification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Notification.Implementations
{
    public class NotificationDomain: INotificationDomain
    {
        private readonly IConfiguration configuration;
        public NotificationDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<NotificationDetail>> GetNotifications(int employeeSlno)
        {
            using (NotificationRespository NotificationRespository = new(configuration))
            {
                return await NotificationRespository.GetNotifications(employeeSlno);
            }
        }
    }
}
