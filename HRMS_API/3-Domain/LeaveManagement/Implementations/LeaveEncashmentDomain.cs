using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.LeaveManagement;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.LeaveManagement.Implementations
{
    public class LeaveEncashmentDomain : ILeaveEncashmentDomain
    {
        private readonly IConfiguration configuration;
        public LeaveEncashmentDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveEncashment>> GetLeaveEncashment(int employeeSlno)
        {
            List<LeaveEncashment> leaveEncashment = null;
            using (LeaveEncashmentRepository leaveEncashmentRepository = new(configuration))
            {
                leaveEncashment = await leaveEncashmentRepository.GetLeaveEncashment(employeeSlno);
            }
            return leaveEncashment;
        }

        public async Task<bool> SaveLeaveEncashment(LeaveEncashmentReq employeeLeaveEncashmentReq)
        {
            using (LeaveEncashmentRepository leaveEncashmentRepository = new(configuration))
            {
                return await leaveEncashmentRepository.SaveLeaveEncashment(employeeLeaveEncashmentReq);
            }
        }
        public async Task<bool> UpdateEmployeeEncashmentStatus(UpdateEncashmentReq leaveDetail)
        {
            using (LeaveEncashmentRepository leaveEncashmentRepository = new(configuration))
            {
                return await leaveEncashmentRepository.UpdateEmployeeEncashmentStatus(leaveDetail);
            }
        }

        public async Task<bool> DeleteLeaveEncashment(DeleteEncashmentReq deleteEncashmentReq)
        {
            using (LeaveEncashmentRepository leaveEncashmentRepository = new(configuration))
            {
                return await leaveEncashmentRepository.DeleteLeaveEncashment(deleteEncashmentReq);
            }
        }
        public async Task<decimal> GetEmployeeTDSAmountDetails(EmployeeTDSMountDetails employeeTDSMountDetails)
        {
            decimal tdsAmount = 0;
            using (LeaveEncashmentRepository leaveEncashmentRepository = new(configuration))
            {
                tdsAmount = await leaveEncashmentRepository.GetEmployeeTDSAmountDetails(employeeTDSMountDetails);
            }
            return tdsAmount;
        }
        public async Task<List<LeaveEncashmentApprovalsDetails>> GetLeavesEncashmentApproval(int employeeSlno)
        {
            List<LeaveEncashmentApprovalsDetails> leaveEncashmentApprovals = null;
            using (LeaveEncashmentRepository leaveEncashmentRepository = new(configuration))
            {
                leaveEncashmentApprovals = await leaveEncashmentRepository.GetLeavesEncashmentApproval(employeeSlno);
            }
            return leaveEncashmentApprovals;

        }
    }
}
