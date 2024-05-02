using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.LeaveManagement.Interfaces
{
    public interface ILeaveEntitlementDomain
    {
        Task<List<LeaveEntitlement>> GetLeaveEntitlement(GetEmployeeLeaveEntitlementReq employeeLeaveEntitlementReq);
        Task<bool> UpdateLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements);
        Task<bool> SaveLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements);
        Task<bool> DeleteLeaveEntitlement(DeleteEmployeeLeaveEntitlementReq deleteEmployeeLeaveEntitlementReq);
    }
}
