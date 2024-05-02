using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Application.Masters.Implementations
{
    public class LeaveStatusApplication : ILeaveStatusApplication
    {
        private readonly ILeaveStatusDomain leaveStatusDomain;
        public LeaveStatusApplication(ILeaveStatusDomain leaveStatusDomain)
        {
            this.leaveStatusDomain = leaveStatusDomain;
        }

        public async Task<List<LeaveStatus>> GetLeaveStatus()
        {
            List<LeaveStatus> leaveStatus = await leaveStatusDomain.GetLeaveStatus();
            return leaveStatus;
        }
    }
}