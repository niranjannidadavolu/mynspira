using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Masters
{
    public class AttendanceReportTypeRepository: BaseRepository
    {

        private readonly IConfiguration configuration;
        public AttendanceReportTypeRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<AttendanceReportType>> GetAttendanceReportTypes()
        {
            List<AttendanceReportType> reportTypes = null;
            string sqlQuery = "SELECT SLNO AS Slno,NAME AS Name,STATUSID AS StatusId FROM PORTAL.POR_ATT_REPORT_TYPE_MT WHERE STATUSID=1";
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                sqlQuery = string.Format(sqlQuery, "1");
                reportTypes = (await connection.QueryAsync<AttendanceReportType>(sqlQuery, commandType: CommandType.Text)).ToList();
            }
            return reportTypes;
        }
    }
}
