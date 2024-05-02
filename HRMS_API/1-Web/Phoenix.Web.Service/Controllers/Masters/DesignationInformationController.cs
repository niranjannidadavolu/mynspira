using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Model.Business.Masters;


using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Application.Masters.Implementations;
using Phoenix.Model.Business;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Masters
{
    [Route("api/[controller]")]
    [ApiController]
    public class DesignationInformationController : BaseController
    {
        private readonly IDesignationInformationApplication designationInformationApplication;

        public DesignationInformationController(IDesignationInformationApplication designationInformationApplication)
        {
            this.designationInformationApplication = designationInformationApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetDesignationInformations")]
        public async Task<List<DesignationInformation>> GetDesignationInformations()
        {
            List<DesignationInformation> designationInformation = await designationInformationApplication.GetDesignationInformations();
            return designationInformation;
        }

        [Authorize]
        [HttpGet]
        [Route("GetDesignationInformationsByDepartment")]
        public async Task<List<DesignationInformation>> GetDesignationInformationsByDepartment(int departmentSlno)
        {
            List<DesignationInformation> designationInformation = await designationInformationApplication.GetDesignationInformationsByDepartment(departmentSlno);
            return designationInformation;
        }

    }

}
