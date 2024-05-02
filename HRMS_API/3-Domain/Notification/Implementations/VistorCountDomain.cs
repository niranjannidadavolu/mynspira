using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Notificaton;
using Phoenix.Domain.Notification.Interfaces;
using System.Threading.Tasks;

namespace Phoenix.Domain.Notification.Implementations
{
    public class VistorCountDomain: IVistorCountDomain
    {
        private readonly IConfiguration configuration;

        public VistorCountDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public async Task<int> GetVisitorCount()
        {
            int usersCount = 0;
            using (VistorCountRespository dashboardRepository = new VistorCountRespository(configuration))
            {
                usersCount = await dashboardRepository.GetVisitorCount();
            }
            return usersCount;
        }
    }
}
