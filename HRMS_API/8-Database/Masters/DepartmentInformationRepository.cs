using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Masters;

using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Masters
{
    /// <summary>
    /// Employee Investment Declarations.
    /// </summary>
    public class DepartmentInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public DepartmentInformationRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<DepartmentInformation>> GetDepartmentInformations()
        {
            List<DepartmentInformation> departmentInformation = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                departmentInformation = (await connection.QueryAsync<DepartmentInformation>(PerformanceManagement.SP_GET_ALL_DEPARTMENTS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return departmentInformation;

        }


    }
}
