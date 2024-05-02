using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Attendance;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Attendance
{
    public class HolidayRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public HolidayRepository(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<HolidayInformation>> GetEmployeeHolidays(long employeeId)
        {
            List<HolidayInformation> attendance = null;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeId, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                IEnumerable<HolidayInformation> dbAttendance = (await connection.QueryAsync<HolidayInformation>(DatabaseProcedures.P_GET_PORTAL_HOLIDAYS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
                attendance = dbAttendance.ToList();
            }
            return attendance;
        }
    }
}
