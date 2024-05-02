using Dapper.Oracle;
using Dapper;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using System.Data;
using System.Linq;

using static Phoenix.CrossCutting.Enumerations.Enumerations;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Enumerations;

namespace Phoenix.Database.Repository.Administration
{
    public class SecurityModuleRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public SecurityModuleRepository(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }


        public async Task<List<SecurityModule>> LoadMappedPermissions(int roleId)
        {
            List<SecurityModule> securityModules = null;
            List<SecurityModule> mappedPermissions = null;
            List<SecurityModule> modules = null;
            securityModules = new List<SecurityModule>();

            modules = await LoadActiveModuleInformations();
            mappedPermissions = await LoadRoleMappedScreens(roleId);
            foreach (SecurityModule mainPermission in modules)
            {
                SecurityModule permission = mappedPermissions.Where(x => x.Id == mainPermission.Id).FirstOrDefault();
                if (permission != null)
                {
                    mainPermission.RolePermission = true;
                }
            }
            securityModules.AddRange(modules);
            return securityModules;
        }

        private async Task<List<SecurityModule>> LoadActiveModuleInformations()
        {
            List<SecurityModule> activeModuleInformations = null;
            using (ModuleInformationRepository repository = new ModuleInformationRepository(this.configuration, this.redisCache))
            {
                activeModuleInformations = await repository.LoadActiveModuleInformations();
            }
            return activeModuleInformations;
        }

        public async Task<bool> SavePermissions(List<SecurityModule> permissions, int roleId)
        {
            bool isSaved = false;
            List<int> selectedPermissions = permissions.Select(x => x.Id).ToList();
            int updatedRecords = 0;
            int rowsUpdated = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iPERMISSIONS", selectedPermissions.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, selectedPermissions.Count, 
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parmeters.Add(name: "iROLESLNO", roleId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iLOGGED_IN_USER", 21005, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_PERMISSIONS, parmeters, commandType: CommandType.StoredProcedure);
                rowsUpdated = parmeters.Get<int>("AFFECTEDROWCOUNT");
            }

            isSaved = rowsUpdated > 0;
            return isSaved;
        }

        private async Task<List<SecurityModule>> LoadRoleMappedScreens(int roleId)
        {
            List<SecurityModule> modules = new List<SecurityModule>();
            List<ScreenInformation> screenInformations = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iROLESLNO", roleId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                screenInformations = (await connection.QueryAsync<ScreenInformation>(DatabaseProcedures.SP_GET_ROLE_SCREENS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            modules = (from moduleInformation in screenInformations
                       select new SecurityModule
                       {

                           Id = moduleInformation.ScreenId,
                           Name = moduleInformation.ScreenName,
                           StatusId = moduleInformation.StatusId,
                           ParentId = moduleInformation.ParentScreenId,
                           NodeLevel = Enumerations.NodeLevel.Module,
                           NodeType = Enumerations.NodeType.Module.ToString(),
                           Items = LoadPageInformations(screenInformations.Where(x => x.ParentScreenId == moduleInformation.ScreenId).ToList()),
                       }).ToList();
            return modules;
        }

        private List<SecurityModule> LoadPageInformations(List<ScreenInformation> screenInformations)
        {
            List<SecurityModule> modules = null;
            modules = (from moduleInformation in screenInformations
                       select new SecurityModule
                       {

                           Id = moduleInformation.ScreenId,
                           Name = moduleInformation.ScreenName,
                           StatusId = moduleInformation.StatusId,
                           ParentId = moduleInformation.ParentScreenId,
                           NodeLevel = Enumerations.NodeLevel.Module,
                           NodeType = Enumerations.NodeType.Module.ToString(),
                           Items = LoadPageInformations(screenInformations.Where(x => x.ParentScreenId == moduleInformation.ScreenId).ToList()),
                       }).ToList();
            return modules;
        }
    }
}
