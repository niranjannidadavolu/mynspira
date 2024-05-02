using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Application.Masters.Interfaces
{
    public interface ILeaveStatusApplication
    {
        Task<List<LeaveStatus>> GetLeaveStatus();
    }
}
