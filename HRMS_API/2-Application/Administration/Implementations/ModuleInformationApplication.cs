using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Application.Base;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;

namespace Phoenix.Application.Administration.Implementations
{
    public sealed class ModuleInformationApplication : BaseApplication, IModuleInformationApplication
    {
        private readonly IModuleInformationDomain ModuleInformationDomain;
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;


        public ModuleInformationApplication(IModuleInformationDomain ModuleInformationDomain, IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration, redisCache)
        {
            this.ModuleInformationDomain = ModuleInformationDomain;
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<SecurityModule>> LoadActiveModuleInformations()
        {
            List<SecurityModule> moduleInformations = null;
            moduleInformations = await this.ModuleInformationDomain.LoadActiveModuleInformations();
            return moduleInformations;
        }
    }
}
