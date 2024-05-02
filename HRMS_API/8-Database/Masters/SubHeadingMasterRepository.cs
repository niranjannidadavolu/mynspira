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
    public class SubHeadingMasterRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public SubHeadingMasterRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<SubHeadingMaster>> GetSubHeadingMasters(int finSLNo)
        {
            List<SubHeadingMaster> tdsSubHeadingDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                tdsSubHeadingDetails = (await connection.QueryAsync<SubHeadingMaster>(DatabaseProcedures.TDS_SUBHEAD_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return tdsSubHeadingDetails;
        }
    }
}
