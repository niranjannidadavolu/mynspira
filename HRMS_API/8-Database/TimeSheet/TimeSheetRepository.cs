using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.TimeSheet;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.TimeSheet
{
    public class TimeSheetRepository : BaseRepository
    {
        private IConfiguration configuration;

        public TimeSheetRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<TimeSheetProjectDetails>> GetEmployeeProjectDetails(int employeeSlno)
        {
            List<TimeSheetProjectDetails> employeePorjects = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "DATACUR1", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.SP_GET_EMP_PROJECT_DETAILS, parameters, commandType: CommandType.StoredProcedure);
               
                employeePorjects = results.Read<TimeSheetProjectDetails>().ToList();
                var taskInformation = results.Read<TaskInformation>().ToList();

                foreach (var item in employeePorjects)
                {
                    item.TaskInformation = taskInformation.ToList();
                }

            }
            return employeePorjects;
        }
    }
}
