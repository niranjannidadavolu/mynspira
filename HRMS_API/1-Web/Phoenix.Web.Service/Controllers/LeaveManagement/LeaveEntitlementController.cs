using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.LeaveManagement;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.LeaveManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeaveEntitlementController : BaseController
    {
        private readonly ILeaveEntitlementApplication leaveEntitlementApplication;

        public LeaveEntitlementController(ILeaveEntitlementApplication leaveEntitlementApplication)
        {
            this.leaveEntitlementApplication = leaveEntitlementApplication;
        }

        [Authorize]
        [HttpPost]
        [Route("GetLeaveEntitlement")]
        public async Task<List<LeaveEntitlement>> GetLeaveEntitlement(GetEmployeeLeaveEntitlementReq employeeLeaveEntitlementReq)
        {
            List<LeaveEntitlement> leaveEntitlementList = await leaveEntitlementApplication.GetLeaveEntitlement(employeeLeaveEntitlementReq);

            return leaveEntitlementList;
        }

        [Authorize]
        [HttpPost]
        [Route("UpdateLeaveEntitlement")]
        public async Task<bool> UpdateLeaveEntitlement([FromBody] List<LeaveEntitlement> leaveEntitlements)
        {
            bool isUpdated = await leaveEntitlementApplication.UpdateLeaveEntitlement(leaveEntitlements);
            return isUpdated;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveLeaveEntitlement")]
        public async Task<bool> SaveLeaveEntitlement([FromBody] List<LeaveEntitlement> leaveEntitlements)
        {
            bool isUpdated = await leaveEntitlementApplication.SaveLeaveEntitlement(leaveEntitlements);
            return isUpdated;
        }

        [Authorize]
        [HttpPost]
        [Route("DeleteLeaveEntitlement")]
        public async Task<bool>  DeleteLeaveEntitlement(DeleteEmployeeLeaveEntitlementReq deleteEmployeeLeaveEntitlementReq)
        {
            bool isUpdated = await leaveEntitlementApplication.DeleteLeaveEntitlement(deleteEmployeeLeaveEntitlementReq);
            return isUpdated;
        }
    }
}
