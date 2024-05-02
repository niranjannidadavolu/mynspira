using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Masters;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Domain.Masters.Implementations
{
    public class LeaveTypeDomain : ILeaveTypeDomain
    {
        private readonly IConfiguration configuration;
        public LeaveTypeDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveType>> GetAssignedLeaveTypes(int employeeSlno)
        {
            List<LeaveType> leaveTypes = null;
            using (LeaveTypeRepository leaveTypeRepository = new LeaveTypeRepository(configuration))
            {
                leaveTypes = await leaveTypeRepository.GetAssignedLeaveTypes(employeeSlno);
            }
            return leaveTypes;
        }

        public async Task<List<LeaveType>> GetLeaveTypes()
        {
            List<LeaveType> leaveTypes = null;
            using (LeaveTypeRepository leaveTypeRepository = new LeaveTypeRepository(configuration))
            {
                leaveTypes = await leaveTypeRepository.GetLeaveTypes();
            }
            return leaveTypes;
        }        
    }
}
