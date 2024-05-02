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
    public class LeaveDayTypeController : BaseController
    {
        private readonly ILeaveDayTypeApplication leaveDayTypeApplication;

        public LeaveDayTypeController(ILeaveDayTypeApplication leaveDayTypeApplication)
        {
            this.leaveDayTypeApplication = leaveDayTypeApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetLeaveDayTypes")]
        public async Task<List<LeaveDayType>> GetLeaveDayTypes()
        {
            List<LeaveDayType> leaveDayTypes = await leaveDayTypeApplication.GetLeaveDayTypes();
            return leaveDayTypes;
        }
    }
}
