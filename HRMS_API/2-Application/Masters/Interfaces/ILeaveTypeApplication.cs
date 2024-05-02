using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Application.Masters.Interfaces
{
    public interface ILeaveTypeApplication
    {
        Task<List<LeaveType>> GetAssignedLeaveTypes(int employeeSlno);
        Task<List<LeaveType>> GetLeaveTypes();
    }
}
