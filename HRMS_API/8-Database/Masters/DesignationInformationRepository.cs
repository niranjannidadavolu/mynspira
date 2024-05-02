using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business;
using Phoenix.Model.Business.Masters;
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
    public class DesignationInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public DesignationInformationRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<DesignationInformation>> GetDesignationInformations()
        {
            List<DesignationInformation> designationInformation = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                designationInformation = (await connection.QueryAsync<DesignationInformation>(Master.SP_GET_ALL_DESIGNATION, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return designationInformation;

        }

        public async Task<List<DesignationInformation>> GetDesignationInformationsByDepartment(int departmentSlno)
        {
            List<DesignationInformation> designationInformation = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iDEPARTMENTSLNO", departmentSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                designationInformation = (await connection.QueryAsync<DesignationInformation>(Master.SP_GET_DESIGNATIONS_BY_DEPT, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return designationInformation;

        }


    }
}
