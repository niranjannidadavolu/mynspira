using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Administration;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Domain.Base;
using Phoenix.Model.Business.Administration;

namespace Phoenix.Domain.Administration.Implementations
{
    public sealed class SecurityModuleDomain : BaseDomain, ISecurityModuleDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public SecurityModuleDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<SecurityModule>> LoadMappedPermissions(int roleId)
        {
            List<SecurityModule> securityModules = null;
            using (SecurityModuleRepository securityModuleRepository = new SecurityModuleRepository(this.configuration, this.redisCache))
            {
                securityModules = await securityModuleRepository.LoadMappedPermissions(roleId);
            }
            return securityModules;
        }

        public async Task<List<SecurityModule>> LoadRoleLevelAccessPermisssions()
        {
            List<SecurityModule> securityModules = null;
            //using (SecurityModuleRepository securityModuleRepository = new SecurityModuleRepository(this.configuration, this.redisCache))
            //{
            //    securityModules = securityModuleRepository.LoadRoleLevelAccessPermisssions();
            //}
            return securityModules;
        }

        public async Task<bool> SavePermissions(List<SecurityModule> permissions, int roleId)
        {
            bool isSaved = false;
            using (SecurityModuleRepository securityModuleRepository = new SecurityModuleRepository(this.configuration, this.redisCache))
            {
                isSaved = await securityModuleRepository.SavePermissions(permissions, roleId);
            }
            return isSaved;
        }
    }
}
