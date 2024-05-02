using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.PMS
{
    public class ManagerPerformanceEvaluationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache rediscache;

        public ManagerPerformanceEvaluationRepository(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<MappedDepartmentInformation>> GetMyAssignedDepartments(int employeeSlno)
        {
            List<MappedDepartmentInformation> departmentInformation = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add("IMANAGER_ID", employeeSlno, OracleMappingType.Int32,ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                departmentInformation = (await connection.QueryAsync<MappedDepartmentInformation>(PerformanceManagement.SP_GET_MY_ASSIGNED_DEPARTMENTS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return departmentInformation;
        }
        
    }
}
