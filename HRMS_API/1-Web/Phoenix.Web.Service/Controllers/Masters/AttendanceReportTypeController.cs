using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.LeaveManagement.Implementations;
using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Model.Business.Masters;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Masters
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttendanceReportTypeController : BaseController
    {
        private readonly IAttendanceReportTypeApplication attendanceReportTypeApplication;

        public AttendanceReportTypeController(IAttendanceReportTypeApplication attendanceReportTypeApplication)
        {
            this.attendanceReportTypeApplication = attendanceReportTypeApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAttendanceReportTypes")]
        public async Task<List<AttendanceReportType>> GetAttendanceReportTypes()
        {
            List<AttendanceReportType> reportTypes = await attendanceReportTypeApplication.GetAttendanceReportTypes();
            return reportTypes;
        }
    }
}
