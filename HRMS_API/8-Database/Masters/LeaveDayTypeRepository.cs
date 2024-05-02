using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.Infrastructure.Dapper;
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
    public class LeaveDayTypeRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public LeaveDayTypeRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveDayType>> GetLeaveDayTypes()
        {
            List<LeaveDayType> leaveDayTypes = null;
            string sqlQuery = "SELECT LEAVE_DAY_TYPE_ID AS LEAVEDAYTYPEID,LEAVE_DAY_TYPE_NAME AS LEAVEDAYTYPENAME,LEAVE_DAY_TYPE_CODE AS LEAVEDAYTYPECODE FROM LEAVE_DAY_TYPE";
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                sqlQuery = string.Format(sqlQuery, "1");
                leaveDayTypes = (await connection.QueryAsync<LeaveDayType>(sqlQuery, commandType: CommandType.Text)).ToList();
            }
            return leaveDayTypes;
        }

    }
}
