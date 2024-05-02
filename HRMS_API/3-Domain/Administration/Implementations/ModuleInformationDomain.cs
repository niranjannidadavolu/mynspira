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
    public sealed class ModuleInformationDomain : BaseDomain, IModuleInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public ModuleInformationDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<SecurityModule>> LoadActiveModuleInformations()
        {
            List<SecurityModule> moduleInformations = null;
            using (ModuleInformationRepository moduleInformationRepository = new ModuleInformationRepository(this.configuration, this.redisCache))
            {
                moduleInformations = await moduleInformationRepository.LoadActiveModuleInformations();
            }

            return moduleInformations;
        }
    }
}
