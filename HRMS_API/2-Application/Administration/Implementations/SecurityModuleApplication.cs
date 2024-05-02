using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Application.Base;
using Phoenix.Domain.Administration.Interfaces;

namespace Phoenix.Application.Administration.Implementations
{
    public sealed class SecurityModuleApplication : BaseApplication, ISecurityModuleApplication
    {
        private readonly ISecurityModuleDomain SecurityModuleDomain;
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public SecurityModuleApplication(ISecurityModuleDomain SecurityModuleDomain, IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration, redisCache)
        {
            this.SecurityModuleDomain = SecurityModuleDomain;
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<SecurityModule>> LoadMappedPermissions(int roleId)
        {
            List<SecurityModule> securityModules = null;
            securityModules = await SecurityModuleDomain.LoadMappedPermissions(roleId);
            return securityModules;
        }

        public async Task<List<SecurityModule>> LoadRoleLevelAccessPermisssions()
        {
            List<SecurityModule> securityModules = null;
            securityModules = await SecurityModuleDomain.LoadRoleLevelAccessPermisssions();
            return securityModules;
        }

        public async Task<bool> SavePermissions(List<SecurityModule> permissions, int roleId)
        {
            bool isSaved = false;
            isSaved = await SecurityModuleDomain.SavePermissions(permissions, roleId);
            return isSaved;
        }
    }
}
