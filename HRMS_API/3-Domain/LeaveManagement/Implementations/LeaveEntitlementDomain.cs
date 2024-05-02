using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.LeaveManagement;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.LeaveManagement.Implementations
{
    public class LeaveEntitlementDomain : ILeaveEntitlementDomain
    {
        private readonly IConfiguration configuration;
        public LeaveEntitlementDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveEntitlement>> GetLeaveEntitlement(GetEmployeeLeaveEntitlementReq employeeLeaveEntitlementReq)
        {
            List<LeaveEntitlement> leaveEntitlements = null;
            using (LeaveEntitlementRepository leaveEntitlementRepository = new(configuration))
            {
                leaveEntitlements = await leaveEntitlementRepository.GetLeaveEntitlement(employeeLeaveEntitlementReq);
            }
            return leaveEntitlements;
        }
        public async Task<bool> UpdateLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements)
        {
            using (LeaveEntitlementRepository leaveEntitlementRepository = new(configuration))
            {
                return await leaveEntitlementRepository.UpdateLeaveEntitlement(leaveEntitlements);
            }
        }
        public async Task<bool> SaveLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements)
        {
            using (LeaveEntitlementRepository leaveEntitlementRepository = new(configuration))
            {
                return await leaveEntitlementRepository.SaveLeaveEntitlement(leaveEntitlements);
            }
        }
        public async Task<bool> DeleteLeaveEntitlement(DeleteEmployeeLeaveEntitlementReq deleteEmployeeLeaveEntitlementReq)
        {
            using (LeaveEntitlementRepository leaveEntitlementRepository = new(configuration))
            {
                return await leaveEntitlementRepository.DeleteLeaveEntitlement(deleteEmployeeLeaveEntitlementReq);
            }
        }
    }
}
