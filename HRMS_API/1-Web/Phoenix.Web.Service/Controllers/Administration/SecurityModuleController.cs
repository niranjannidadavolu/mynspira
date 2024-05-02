using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Administration
{
    [Authorize]
    public class SecurityModuleController : BaseController
    {
        private readonly ISecurityModuleApplication SecurityModuleApplication;
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public SecurityModuleController(ISecurityModuleApplication SecurityModuleApplication, IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration, redisCache)
        {
            this.SecurityModuleApplication = SecurityModuleApplication;
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        [HttpGet("api/[Controller]/LoadRoleLevelAccessPermisssions")]
        public async Task<List<SecurityModule>> LoadRoleLevelAccessPermisssions()
        {
            List<SecurityModule> securityModules;
            securityModules = await SecurityModuleApplication.LoadRoleLevelAccessPermisssions();
            return securityModules;
        }

        [HttpGet("api/[Controller]/LoadMappedPermissions")]
        public async Task<List<SecurityModule>> LoadMappedPermissions(int roleId)
        {
            List<SecurityModule> securityModules;
            securityModules = await SecurityModuleApplication.LoadMappedPermissions(roleId);
            return securityModules;
        }

        [HttpPost("api/[Controller]/SavePermissions")]
        public async Task<bool> SavePermissions([FromBody] UserRolePermissions userRolePermissions)
        {
            bool isSaved = false;
            isSaved = await SecurityModuleApplication.SavePermissions(userRolePermissions.Permissions, userRolePermissions.RoleId);
            return isSaved;
        }
    }
}