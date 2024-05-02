using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.LeaveManagement.Interfaces
{
    public interface ILeaveEncashmentDomain
    {
        Task<List<LeaveEncashment>> GetLeaveEncashment(int employeeSlno);
        Task<bool> SaveLeaveEncashment(LeaveEncashmentReq employeeLeaveEncashmentReq);
        Task<bool> DeleteLeaveEncashment(DeleteEncashmentReq deleteEncashmentReq);
        Task<decimal> GetEmployeeTDSAmountDetails(EmployeeTDSMountDetails employeeTDSMountDetails);
        Task<List<LeaveEncashmentApprovalsDetails>> GetLeavesEncashmentApproval(int employeeSlno);
        Task<bool> UpdateEmployeeEncashmentStatus(UpdateEncashmentReq leaveDetail);

    }
}
