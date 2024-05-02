using System;
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
using Phoenix.Model.Business.SearchCriteria.Administration;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Administration
{
    public class RoleInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public RoleInformationRepository(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<RoleInformation>> GetUserRoles(long employeeSlno)
        {
            List<RoleInformation> userRoles = null;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                userRoles = (await connection.QueryAsync<RoleInformation>(Admin.SP_GET_EMPLOYEE_ROLES, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return userRoles;
        }

        public Task<bool> DeActivateRole(long roleSlno)
        {
            throw new NotImplementedException();
        }

        public Task<bool> ActivateRole(long roleSlno)
        {
            throw new NotImplementedException();
        }

        public async Task<List<RoleInformation>> GetAllActiveRoles()
        {
            List<RoleInformation> userRoles = null;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                userRoles = (await connection.QueryAsync<RoleInformation>(Admin.GET_ACTIVE_ROLES, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return userRoles;
        }

        public async Task<RoleInformation> GetRoleInformation(long roleSlno)
        {
            RoleInformation roleInformation = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iROLESLNO", roleSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                roleInformation = connection.QueryFirst<RoleInformation>(Admin.P_GET_ROLE_INFORMATION, parmeters, commandType: CommandType.StoredProcedure);
            }
            return roleInformation;
        }

        public async Task<bool> MapRolesToUser()
        {
            bool isRolesMapped = false;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                //OracleDynamicParameters parmeters = new OracleDynamicParameters();
                //parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                //userRoles = (await connection.QueryAsync<RoleInformation>(DatabaseProcedures.GET_ACTIVE_ROLES, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return isRolesMapped;
        }

        public async Task<bool> SaveRoleInformation(RoleInformation roleInformation)
        {
            bool isRoleSaved = false;
            int updatedRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iROLESLNO", roleInformation.RoleId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iROLE_NAME", roleInformation.RoleName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parmeters.Add(name: "iDESCRIPTION", roleInformation.Description, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parmeters.Add(name: "iISADMIN", roleInformation.IsAdmin, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iUSER_SLNO", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(Admin.P_SAVE_ROLE_INFORMATION, parmeters, commandType: CommandType.StoredProcedure);
            }
            return (updatedRecords * -1) > 0;
        }

        internal async Task<List<RoleInformation>> GetMappedRoles(int employeeSlno)
        {
            List<RoleInformation> mappedRoles = null;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                mappedRoles = (await connection.QueryAsync<RoleInformation>(Admin.SP_GET_EMPLOYEE_ROLES, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return mappedRoles;
        }

        public async Task<List<RoleInformation>> SearchRoles(RoleInformationSearchCriteria searchCriteria)
        {
            List<RoleInformation> userRoles = null;

            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters(); 
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                userRoles = (await connection.QueryAsync<RoleInformation>(Admin.P_SEARCH_ROLE_INFORMATION, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return userRoles;
        }
    }

}
