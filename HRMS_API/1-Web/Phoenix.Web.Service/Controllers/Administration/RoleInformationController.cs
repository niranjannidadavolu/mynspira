using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.SearchCriteria.Administration;
using Phoenix.Web.Service.Base;
using Phoenix.Web.Service.Helper;

namespace Phoenix.Web.Service.Controllers.Administration
{
    [Route("api/[Controller]/")]
    public class RoleInformationController : BaseController
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;
        private readonly IRoleInformationApplication roleApplication;

        public RoleInformationController(IRoleInformationApplication roleApplication, IConfiguration configuration,  IDistributedCache redisCache)
            : base(configuration, redisCache)
        {
            this.roleApplication = roleApplication;
            this.configuration = configuration;
            this.redisCache = redisCache;
        }


        [Authorize]
        [HttpGet]
        [Route("GetUserRoles")]

        public async Task<List<RoleInformation>> GetUserRoles(long employeeSlno)
        {
            List<RoleInformation> roleInformations = await roleApplication.GetUserRoles(employeeSlno);
            return roleInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAllActiveRoles")]

        public async Task<List<RoleInformation>> GetAllActiveRoles()
        {
            List<RoleInformation> roleInformations = await roleApplication.GetAllActiveRoles();
            return roleInformations;
        }

        [Authorize]
        [HttpPost]
        [Route("SearchRoles")]

        public async Task<List<RoleInformation>> SearchRoles([FromBody] RoleInformationSearchCriteria searchCriteria)
        {
            List<RoleInformation> roleInformations = await roleApplication.SearchRoles(searchCriteria);
            return roleInformations;
        }

        [Authorize]
        [HttpPost]
        [Route("MapRolesToUser")]

        public async Task<List<RoleInformation>> MapRolesToUser()
        {
            List<RoleInformation> roleInformations = await roleApplication.GetAllActiveRoles();
            return roleInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("ActivateRole")]

        public async Task<bool> ActivateRole(long roleSlno)
{
            bool isUserActivated = await roleApplication.ActivateRole(roleSlno);
            return isUserActivated;
        }

        [Authorize]
        [HttpGet]
        [Route("DeActivateRole")]

        public async Task<bool> DeActivateRole(long roleSlno)
{
            bool isUserDeactivated = await roleApplication.DeActivateRole(roleSlno);
            return isUserDeactivated;
        }

        [Authorize]
        [HttpGet]
        [Route("GetRoleInformation")]

        public async Task<RoleInformation> GetRoleInformation(long roleSlno)
        {
            RoleInformation roleInformation = await roleApplication.GetRoleInformation(roleSlno);
            return roleInformation;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveRoleInformation")]

        public async Task<bool> SaveRoleInformation([FromBody] RoleInformation roleInformation)
        {
            bool isSaved = await roleApplication.SaveRoleInformation(roleInformation);
            return isSaved;
        }
    }
}
