using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Application.Masters.Implementations
{
    public class LeaveTypeApplication : ILeaveTypeApplication
    {
        private readonly ILeaveTypeDomain leaveTypeDomain;
        public LeaveTypeApplication(ILeaveTypeDomain leaveTypeDomain)
        {
            this.leaveTypeDomain = leaveTypeDomain;
        }

        public async Task<List<LeaveType>> GetAssignedLeaveTypes(int employeeSlno)
        {
            List<LeaveType> leaveTypes = await leaveTypeDomain.GetAssignedLeaveTypes(employeeSlno);
            return leaveTypes;
        }

        public async Task<List<LeaveType>> GetLeaveTypes()
        {
            List<LeaveType> leaveTypes = await leaveTypeDomain.GetLeaveTypes();
            return leaveTypes;
        }
    }
}