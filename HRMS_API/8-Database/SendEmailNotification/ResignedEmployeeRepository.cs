using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.SendEmailNotification;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.SendEmailNotification
{
    public class ResignedEmployeeRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public ResignedEmployeeRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<ResignedEmployee>> GetResignedEmployees()
        {
            List<ResignedEmployee> emailList = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                emailList = (await connection.QueryAsync<ResignedEmployee>(DatabaseProcedures.SP_GET_RESIGNED_EMPLOYEES, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return emailList;
        }
    }
}
