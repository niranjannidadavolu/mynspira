using Phoenix.Model.Business.LeaveManagement;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.LeaveManagement.Interfaces
{
    public interface ILeaveEntitlementApplication
    {
        Task<List<LeaveEntitlement>> GetLeaveEntitlement(GetEmployeeLeaveEntitlementReq employeeLeaveEntitlementReq);
        Task<bool> UpdateLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements);
        Task<bool> SaveLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements);
        Task<bool> DeleteLeaveEntitlement(DeleteEmployeeLeaveEntitlementReq deleteEmployeeLeaveEntitlementReq);
    }
}
