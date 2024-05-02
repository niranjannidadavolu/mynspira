using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.States;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.States
{
    public  class StatesRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public StatesRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<StatesDetails>> GetStatesDetails()
        {
            List<StatesDetails> statesDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                statesDetails = (await connection.QueryAsync<StatesDetails>(CrossCutting.Resources.Investment.STATE_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return statesDetails;
        }
    }
}
