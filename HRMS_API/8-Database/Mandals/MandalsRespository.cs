using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Mandals;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Mandals
{
    public  class MandalsRespository: BaseRepository
    {
        private readonly IConfiguration configuration;
        public MandalsRespository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<MandalDetails>> GetMandalDetails(int districtSlNo)
        {
            List<MandalDetails> mandalDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iDISTRICTSLNO", districtSlNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                mandalDetails = (await connection.QueryAsync<MandalDetails>(CrossCutting.Resources.Investment.MANDAL_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return mandalDetails;
        }
    }
}
