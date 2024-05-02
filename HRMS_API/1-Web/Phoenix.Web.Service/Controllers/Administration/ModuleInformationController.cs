using System.Collections.Generic;
using System.Threading.Tasks;

using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Administration
{
    [Authorize]
    public class ModuleInformationController : BaseController
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;
        private readonly IModuleInformationApplication moduleInformationApplication;

        public ModuleInformationController(IModuleInformationApplication moduleInformationApplication, IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration, redisCache)
        {
            this.moduleInformationApplication = moduleInformationApplication;
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        [HttpGet("api/[Controller]/LoadActiveModuleInformations")]
        public async Task<List<SecurityModule>> LoadActiveModuleInformations()
        {
            List<SecurityModule> moduleInformations = await moduleInformationApplication.LoadActiveModuleInformations();
            return moduleInformations;
        }
    }
}