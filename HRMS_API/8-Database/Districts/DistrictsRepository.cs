using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Districts;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Districts
{
    public class DistrictsRepository: BaseRepository
    {
        private readonly IConfiguration configuration;
        public DistrictsRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<DistrictDetails>> GetDistrictDetails(int stateSlNo)
        {
            List<DistrictDetails> districtDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iSTATESLNO", stateSlNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                districtDetails = (await connection.QueryAsync<DistrictDetails>(CrossCutting.Resources.Investment.DISTRICT_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return districtDetails;
        }
    }
}
