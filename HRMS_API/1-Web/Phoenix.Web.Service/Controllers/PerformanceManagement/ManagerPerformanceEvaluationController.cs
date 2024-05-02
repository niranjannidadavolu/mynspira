using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Interfaces;
using Microsoft.AspNetCore.Authorization;
using System.Threading.Tasks;
using Phoenix.Model.Business.PMS;
using System.Collections.Generic;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.PerformanceManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManagerPerformanceEvaluationController : BaseController
    {
        private readonly IManagerPerformanceEvaluationApplication assignedDepartmentsApplication;
        public ManagerPerformanceEvaluationController(IManagerPerformanceEvaluationApplication assignedDepartmentsApplication)
        {
            this.assignedDepartmentsApplication = assignedDepartmentsApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetMyAssignedDepartments")]
        public async Task<List<MappedDepartmentInformation>> GetMyAssignedDepartments(int employeeSlno)
        {
            List<MappedDepartmentInformation> departmentInformation = await assignedDepartmentsApplication.GetMyAssignedDepartments(employeeSlno);
            return departmentInformation;
        }
    }
}