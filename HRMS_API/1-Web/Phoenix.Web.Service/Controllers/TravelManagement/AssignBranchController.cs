using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.TMS.Interfaces;
using Phoenix.Application.TravelManagement.Interfaces;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Web.Service.Controllers.TravelManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssignBranchController : ControllerBase
    {
        private readonly IAssignBranchApplication employeeBranchMappingApplication;
        public AssignBranchController(IAssignBranchApplication employeeBranchMappingApplication)
        {
            this.employeeBranchMappingApplication = employeeBranchMappingApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAllEmployeeBranchMappings")]
        public async Task<EmployeeBranchMapping> GetAllEmployeeBranchMappings()
        {
            EmployeeBranchMapping assignBranch = await employeeBranchMappingApplication.GetAllEmployeeBranchMappings();
            return assignBranch;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeBranchMappings")]
        public async Task<List<LocationMappingDetail>> GetEmployeeBranchMappings(int employeeId)
        {
            List<LocationMappingDetail> assignedBranches = await employeeBranchMappingApplication.GetEmployeeBranchMappings(employeeId);
            return assignedBranches;
        }

        [Authorize]
        [HttpPost]
        [Route("MapSelectedBranchesToEmployee")]

        public async Task<bool> MapSelectedBranchesToEmployee([FromBody] AssignBranch assignBranches)
        {
            bool isSaved = false;
            isSaved = await employeeBranchMappingApplication.MapSelectedBranchesToEmployee(assignBranches);
            return isSaved;
        }
    }
}
