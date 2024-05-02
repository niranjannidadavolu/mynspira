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
    public class FrequencyInformationRepositry : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache rediscache;

        public FrequencyInformationRepositry(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<FrequencyInformation>> LoadAllFrequencies()
        {
            List<FrequencyInformation> frequencyDetails  = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                frequencyDetails = (await connection.QueryAsync<FrequencyInformation>(DatabaseProcedures.SP_GET_FREQUENCIES, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return frequencyDetails;
        }
    }
}
