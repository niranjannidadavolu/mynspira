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
    public class LeaveStatusRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public LeaveStatusRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveStatus>> GetLeaveStatus()
        {
            List<LeaveStatus> leaveStatus = null;
            string sqlQuery = "SELECT LEAVE_STATUS_ID AS LEAVESTATUSID,LEAVE_STATUS_NAME AS LEAVESTATUSNAME,LEAVE_TYPE_CODE AS LEAVETYPECODE FROM PORTAL.LEAVE_STATUS";
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                sqlQuery = string.Format(sqlQuery, "1");
                leaveStatus = (await connection.QueryAsync<LeaveStatus>(sqlQuery, commandType: CommandType.Text)).ToList();
            }
            return leaveStatus;
        }
    }
}
