using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.LeaveManagement.Implementations
{
    public class LeaveEntitlementApplication : ILeaveEntitlementApplication
    {
        private readonly ILeaveEntitlementDomain leaveEntitlementDomain;
        public LeaveEntitlementApplication(ILeaveEntitlementDomain leaveEntitlementDomain)
        {
            this.leaveEntitlementDomain = leaveEntitlementDomain;
        }

        public async Task<List<LeaveEntitlement>> GetLeaveEntitlement(GetEmployeeLeaveEntitlementReq employeeLeaveEntitlementReq)
        {
            List<LeaveEntitlement> leaveEntitlementdetails = await leaveEntitlementDomain.GetLeaveEntitlement(employeeLeaveEntitlementReq);
            return leaveEntitlementdetails;
        }
        public async Task<bool> UpdateLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements)
        {
            bool isUpdated = await leaveEntitlementDomain.UpdateLeaveEntitlement(leaveEntitlements);
            return isUpdated;
        }
        public async Task<bool> SaveLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements)
        {
            bool isUpdated = await leaveEntitlementDomain.SaveLeaveEntitlement(leaveEntitlements);
            return isUpdated;
        }
        public async Task<bool> DeleteLeaveEntitlement(DeleteEmployeeLeaveEntitlementReq deleteEmployeeLeaveEntitlementReq)
        {
            bool isUpdated = await leaveEntitlementDomain.DeleteLeaveEntitlement(deleteEmployeeLeaveEntitlementReq);
            return isUpdated;
        }
    }
}
