using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Administration
{
    public class ModuleInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public ModuleInformationRepository(IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }
        public async Task<List<SecurityModule>> LoadActiveModuleInformations()
        {
            List<SecurityModule> modules = new List<SecurityModule>();
            List<ScreenInformation> screenInformations = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                screenInformations = (await connection.QueryAsync<ScreenInformation>(DatabaseProcedures.SP_GET_ACTIVE_SCREENS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            modules = (from moduleInformation in screenInformations
                       select new SecurityModule
                       {

                           Id = moduleInformation.ScreenId,
                           Name = moduleInformation.ScreenName,
                           StatusId = moduleInformation.StatusId,
                           ParentId = moduleInformation.ParentScreenId,
                           NodeLevel = NodeLevel.Module,
                           NodeType = NodeType.Module.ToString(),
                           Items = LoadActivePageInformations(screenInformations.Where(x => x.ParentScreenId == moduleInformation.ScreenId).ToList()),
                       }).ToList();
            return modules;
        }
        private List<SecurityModule> LoadActivePageInformations(List<ScreenInformation> screenInformations)
        {
            List<SecurityModule> pages = null;
            pages = (from moduleInformation in screenInformations
                     select new SecurityModule
                     {
                         Id = moduleInformation.ScreenId,
                         Name = moduleInformation.ScreenName,
                         StatusId = moduleInformation.StatusId,
                         ParentId = moduleInformation.ParentScreenId,
                         NodeLevel = NodeLevel.Page,
                         NodeType = NodeType.Page.ToString(),
                         Items = LoadActivePageInformations(screenInformations.Where(x => x.ParentScreenId == moduleInformation.ScreenId).ToList()),
                     }).ToList();
            return pages;
        }
    }
}
