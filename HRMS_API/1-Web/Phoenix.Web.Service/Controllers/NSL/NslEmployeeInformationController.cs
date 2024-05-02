using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.NSL.Interfaces;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.NSL;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.NSL
{
    [Route("api/[controller]")]
    [ApiController]
    public class NslEmployeeProfileController : BaseController
    {
        private readonly INslEmployeeProfileApplication NslEmployeeProfileApplication;

        public NslEmployeeProfileController(INslEmployeeProfileApplication NslEmployeeProfileApplication)
        {
            this.NslEmployeeProfileApplication = NslEmployeeProfileApplication;
        }

        [HttpPost]
        [Route("GetAllEmployeeProfiles")]
        public async Task<PagedResultSet<EmployeeProfileData>> GetAllEmployeeProfiles(EmployeeProfileSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfileData> employeeProfiles = null;
            employeeProfiles = await this.NslEmployeeProfileApplication.GetAllEmployeeProfiles(searchCriteria);
            return employeeProfiles;
        }

        [HttpGet]
        [Route("GetEmployeeProfile")]
        public async Task<EmployeeProfileData> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfileData employeeProfile = null;
            employeeProfile = await this.NslEmployeeProfileApplication.GetEmployeeProfile(employeeId);
            return employeeProfile;
        }


    }
}
