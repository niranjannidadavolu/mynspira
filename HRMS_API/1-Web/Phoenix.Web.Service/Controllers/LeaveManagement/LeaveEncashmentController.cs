using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.Administration.Implementations;
using Phoenix.Application.Investment.Implementations;
using Phoenix.Application.LeaveManagement.Implementations;
using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Web.Service.Helper;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.LeaveManagement
{
    [Route("api/[controller]")]

    [ApiController]
    public class LeaveEncashmentController : ControllerBase
    {
        private readonly ILeaveEncashmentApplication leaveEncashmentApplication;

        public LeaveEncashmentController(ILeaveEncashmentApplication leaveEncashmentApplication)
        {
            this.leaveEncashmentApplication = leaveEncashmentApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetLeaveEncashment")]
        public async Task<List<LeaveEncashment>> GetLeaveEncashment(int employeeSlno)
        {
            List<LeaveEncashment> leaveEncashment = await leaveEncashmentApplication.GetLeaveEncashment(employeeSlno);

            leaveEncashment = leaveEncashment.OrderByDescending(x => x.EncashmentId).ToList();
            return leaveEncashment;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveLeaveEncashment")]
        public async Task<bool> SaveLeaveEntitlement(LeaveEncashmentReq employeeLeaveEncashmentReq)
        {
            bool isUpdated = await leaveEncashmentApplication.SaveLeaveEncashment(employeeLeaveEncashmentReq);
            return isUpdated;
        }
        [Authorize]
        [HttpPost]
        [Route("UpdateEmployeeEncashmentStatus")]
        public async Task<bool> UpdateEmployeeEncashmentStatus(UpdateEncashmentReq leaveDetail)
        {
            bool isUpdated = await leaveEncashmentApplication.UpdateEmployeeEncashmentStatus(leaveDetail);
            return isUpdated;
        }


        [Authorize]
        [HttpPost]
        [Route("DeleteLeaveEncashment")]
        public async Task<bool> DeleteLeaveEncashment(DeleteEncashmentReq deleteEncashmentReq)
        {
            bool isUpdated = await leaveEncashmentApplication.DeleteLeaveEncashment(deleteEncashmentReq);
            return isUpdated;
        }

        [HttpPost]
        [Route("GetEmployeeTDSAmountDetails")]
        public async Task<decimal> GetEmployeeTDSAmountDetails([FromBody] EmployeeTDSMountDetails employeeTDSMountDetails)
        {
            decimal tdsAmount = await leaveEncashmentApplication.GetEmployeeTDSAmountDetails(employeeTDSMountDetails);
            return tdsAmount;
        }

        [HttpGet]
        [Route("GetLeavesEncashmentApproval")]
        public async Task<List<LeaveEncashmentApprovalsDetails>> GetLeavesEncashmentApproval(int employeeSlno)
        {
            List<LeaveEncashmentApprovalsDetails> leaveEncashmentApprovals = await leaveEncashmentApplication.GetLeavesEncashmentApproval(employeeSlno);
            return leaveEncashmentApprovals;
        }

    }
}
