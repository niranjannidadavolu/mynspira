using Microsoft.AspNetCore.Mvc;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Masters
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentInformationController : BaseController
    {
        private readonly IDepartmentInformationApplication departmentInformationApplication;

        public DepartmentInformationController(IDepartmentInformationApplication departmentInformationApplication)
        {
            this.departmentInformationApplication = departmentInformationApplication;
        }

        //[Authorize]
        [HttpGet]
        [Route("GetDepartmentInformations")]
        public async Task<List<DepartmentInformation>> GetDepartmentInformations()
        {
            List<DepartmentInformation> departmentInformation = await departmentInformationApplication.GetDepartmentInformations();
            return departmentInformation;
        }

    }

}
