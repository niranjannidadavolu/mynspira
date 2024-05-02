using Phoenix.Model.Business.Notification;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Notification.Interfaces
{
    public interface IVistorCountDomain
    {
        Task<int> GetVisitorCount();
    }
}
