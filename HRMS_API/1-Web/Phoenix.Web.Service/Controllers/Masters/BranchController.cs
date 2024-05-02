using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Model.Business.Masters;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Masters
{
    [Route("api/[controller]")]
    [ApiController]
    public class BranchController : BaseController
    {

        private readonly IBranchApplication branchApplication;
        public BranchController(IBranchApplication branchApplication)
        {
            this.branchApplication = branchApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAllBranches")]
        public async Task<List<Branch>> GetAllBranches()
        {
            List<Branch> branch = await branchApplication.GetAllBranches();
            return branch;
        }

        [Authorize]
        [HttpGet]
        [Route("GetHRBranch")]
        public async Task<List<Branch>> GetHRBranch(int employeeSlno)
        {
            List<Branch> branch = await branchApplication.GetHRBranch(employeeSlno);
            return branch;
        }

        [Authorize]
        [HttpGet]
        [Route("GetBranchesByOfcType")]
        public async Task<List<Branch>> GetBranchesByOfcType(int officeTypeSlno, int employeeSlno)
        {
            List<Branch> branch = await branchApplication.GetBranchesByOfcType(officeTypeSlno, employeeSlno);
            return branch;
        }

        [Authorize]
        [HttpGet]
        [Route("GetOfficeType")]
        public async Task<List<OfficeType>> GetOfficeType()
        {
            List<OfficeType> officeType = await branchApplication.GetOfficeType();
            return officeType;
        }

        [Authorize]
        [HttpGet]
        [Route("GetHRBranchRMS")]
        public async Task<List<BranchRMS>> GetHRBranchRMS(int employeeSlno)
        {
            List<BranchRMS> branch = await branchApplication.GetHRBranchRMS(employeeSlno);
            return branch;
        }
    }
}
