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
    public class SectionMasterRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public SectionMasterRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<SectionMaster>> GetSetionMasters()
        {
            List<SectionMaster> tdsSectionDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                tdsSectionDetails = (await connection.QueryAsync<SectionMaster>(DatabaseProcedures.TDS_SECTION_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).OrderBy(item => item.SectionSlNo).ToList();
            }
            return tdsSectionDetails;
        }
    }
}
