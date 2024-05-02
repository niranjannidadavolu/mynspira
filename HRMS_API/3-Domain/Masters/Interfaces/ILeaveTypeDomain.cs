using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Domain.Masters.Interfaces
{
    public interface ILeaveTypeDomain
    {
        Task<List<LeaveType>> GetAssignedLeaveTypes(int employeeSlno);
        Task<List<LeaveType>> GetLeaveTypes();
    }
}
