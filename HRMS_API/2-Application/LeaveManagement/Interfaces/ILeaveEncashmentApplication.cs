using Phoenix.Model.Business.LeaveManagement;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.LeaveManagement.Interfaces
{
    public interface ILeaveEncashmentApplication
    {
        Task<List<LeaveEncashment>> GetLeaveEncashment(int employeeSlno);
        Task<bool> SaveLeaveEncashment(LeaveEncashmentReq employeeLeaveEncashmentReq);
        Task<bool> DeleteLeaveEncashment(DeleteEncashmentReq deleteEncashmentReq);
        Task<decimal> GetEmployeeTDSAmountDetails(EmployeeTDSMountDetails employeeTDSMountDetails);
        Task<List<LeaveEncashmentApprovalsDetails>> GetLeavesEncashmentApproval(int employeeSlno);
        Task<bool> UpdateEmployeeEncashmentStatus(UpdateEncashmentReq leaveDetail);
    }
}
