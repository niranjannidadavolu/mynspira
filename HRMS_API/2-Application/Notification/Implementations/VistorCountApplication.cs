using Phoenix.Application.Notification.Interfaces;
using Phoenix.Domain.Notification.Interfaces;
using System.Threading.Tasks;

namespace Phoenix.Application.Notification.Implementations
{
    public class VistorCountApplication : IVistorCountApplication
    {
        private readonly IVistorCountDomain notificationDomain;
        public VistorCountApplication(IVistorCountDomain notificationDomain)
        {
            this.notificationDomain = notificationDomain;
        }

        public async Task<int> GetVisitorCount()
        {
            int usersCount = 0;
            usersCount = await notificationDomain.GetVisitorCount();
            return usersCount;
        }
    }
}
