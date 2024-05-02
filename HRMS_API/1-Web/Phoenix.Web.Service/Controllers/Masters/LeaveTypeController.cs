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
    public class LeaveTypeController : BaseController
    {
        private readonly ILeaveTypeApplication leaveTypeApplication;

        public LeaveTypeController(ILeaveTypeApplication leaveTypeApplication)
        {
            this.leaveTypeApplication = leaveTypeApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetLeaveTypes")]
        public async Task<List<LeaveType>> GetLeaveTypes()
        {
            List<LeaveType> leaveTypes = await leaveTypeApplication.GetLeaveTypes();
            return leaveTypes;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAssignedLeaveTypes")]
        public async Task<List<LeaveType>> GetAssignedLeaveTypes(int employeeSlno)
        {
            List<LeaveType> leaveTypes = await leaveTypeApplication.GetAssignedLeaveTypes(employeeSlno);
            return leaveTypes;
        }
    }

}
