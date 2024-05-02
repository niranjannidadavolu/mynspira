using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.LeaveManagement.Implementations
{
    public class LeaveEncashmentApplication : ILeaveEncashmentApplication
    {
        private readonly ILeaveEncashmentDomain leaveEncashmentDomain;
        public LeaveEncashmentApplication(ILeaveEncashmentDomain leaveEncashmentDomain)
        {
            this.leaveEncashmentDomain = leaveEncashmentDomain;
        }

       
        public async Task<List<LeaveEncashment>> GetLeaveEncashment(int employeeSlno)
        {
            List<LeaveEncashment> leaveEncashment = await leaveEncashmentDomain.GetLeaveEncashment(employeeSlno);
            return leaveEncashment;
        }

        public async Task<bool> SaveLeaveEncashment(LeaveEncashmentReq employeeLeaveEncashmentReq)
        {
            bool isUpdated = await leaveEncashmentDomain.SaveLeaveEncashment(employeeLeaveEncashmentReq);
            return isUpdated;
        }
        public async Task<bool> UpdateEmployeeEncashmentStatus(UpdateEncashmentReq leaveDetail)
        {
            bool isUpdated = await leaveEncashmentDomain.UpdateEmployeeEncashmentStatus(leaveDetail);
            return isUpdated;
        }
        public async Task<bool> DeleteLeaveEncashment(DeleteEncashmentReq deleteEncashmentReq)
        {
            bool isUpdated = await leaveEncashmentDomain.DeleteLeaveEncashment(deleteEncashmentReq);
            return isUpdated;
        }
        public async Task<decimal> GetEmployeeTDSAmountDetails(EmployeeTDSMountDetails employeeTDSMountDetails)
        {
            decimal tdsAmount = await leaveEncashmentDomain.GetEmployeeTDSAmountDetails(employeeTDSMountDetails);
            return tdsAmount;
        }
        public async Task<List<LeaveEncashmentApprovalsDetails>> GetLeavesEncashmentApproval(int employeeSlno)
        {
            List<LeaveEncashmentApprovalsDetails> leaveEncashmentApproval = await leaveEncashmentDomain.GetLeavesEncashmentApproval(employeeSlno);
            return leaveEncashmentApproval;
        }

    }
}
