using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;

using Phonix.CrossCutting.Security;
using Phonix.Model.Business.Investment;
using Phonix.Model.Business.Masters;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phonix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Investment
{
    /// <summary>
    /// Employee Investment Declarations.
    /// </summary>
    public class HouseIncomeDetailRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public HouseIncomeDetailRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<HouseIncomeDetails>> GetHouseIncomeDetails()
        {
            List<HouseIncomeDetails> houseIncomeDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                houseIncomeDetails = (await connection.QueryAsync<HouseIncomeDetails>(DatabaseProcedures.HOUSE_INCOME_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return houseIncomeDetails;
        }
    }
}
