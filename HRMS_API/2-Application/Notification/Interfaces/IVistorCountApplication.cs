using System.Threading.Tasks;

namespace Phoenix.Application.Notification.Interfaces
{
    public interface IVistorCountApplication
    {
        Task<int> GetVisitorCount();
    }
}
