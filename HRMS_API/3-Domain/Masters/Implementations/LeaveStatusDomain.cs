using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Masters;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Masters.Interfaces;

namespace Phoenix.Domain.Masters.Implementations
{
    public class LeaveStatusDomain : ILeaveStatusDomain
    {
        private readonly IConfiguration configuration;
        public LeaveStatusDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveStatus>> GetLeaveStatus()
        {
            List<LeaveStatus> leaveStatus = null;
            using (LeaveStatusRepository leaveStatusRepository = new(configuration))
            {
                leaveStatus = await leaveStatusRepository.GetLeaveStatus();
            }
            return leaveStatus;
        }
    }
}
