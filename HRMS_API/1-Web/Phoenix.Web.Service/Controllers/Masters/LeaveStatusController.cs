using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Model.Business.Masters;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Masters
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeaveStatusController : BaseController
    {
        private readonly ILeaveStatusApplication leaveStatusApplication;

        public LeaveStatusController(ILeaveStatusApplication leaveStatusApplication)
        {
            this.leaveStatusApplication = leaveStatusApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetLeaveStatus")]
        public async Task<List<LeaveStatus>> GetLeaveStatus()
        {
            List<LeaveStatus> leaveStatus = await leaveStatusApplication.GetLeaveStatus();
            return leaveStatus;
        }
    }
}
