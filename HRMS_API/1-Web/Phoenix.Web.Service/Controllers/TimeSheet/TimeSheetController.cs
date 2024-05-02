using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.TimeSheet.Interfaces;
using Phoenix.Model.Business.SearchCriteria.TimeSheet;
using Phoenix.Model.Business.TimeSheet;
using Phoenix.Web.Service.Base;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.TimeSheet
{
    [Route("api/[controller]")]
    [ApiController]
    public class TimeSheetController : BaseApiController
    {
        private readonly ITimeSheetApplication timeSheetApplication;
        public TimeSheetController(ITimeSheetApplication timeSheetApplication)
        {
            this.timeSheetApplication = timeSheetApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeProjectDetails")]
        public async Task<List<TimeSheetProjectDetails>> GetEmployeeProjectDetails(int employeeSLNo)
        {
            List<TimeSheetProjectDetails> projectDetails = await timeSheetApplication.GetEmployeeProjectDetails(employeeSLNo);
            return projectDetails;
        }

        



    }
}

