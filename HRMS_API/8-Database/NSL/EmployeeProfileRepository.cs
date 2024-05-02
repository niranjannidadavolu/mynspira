using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Resources;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using Phoenix.Model.Business.SearchCriteria.NSL;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.NSL
{
    public class EmployeeProfileRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly ICryptography cryptography;
        private readonly IDistributedCache redisCache;

        public EmployeeProfileRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<PagedResultSet<EmployeeProfileData>> GetEmployeeProfiles(EmployeeProfileSearchCriteria searchCriteria)
        {
            List<EmployeeProfileData> employeeProfiles = null;
            PagedResultSet<EmployeeProfileData> profiles = null;
            int totalRecords = 0;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add(name: "ISTART_INDEX", searchCriteria.PageIndex, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IEND_INDEX", (searchCriteria.PageIndex + searchCriteria.PageSize), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oTOTAL_RECORDS", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbScreenInformations = await connection.QueryAsync<EmployeeProfileData>(DatabaseProcedures.SP_GET_NSL_EMPLOYEE_PROFILES, parameters, commandType: CommandType.StoredProcedure);
                totalRecords = parameters.Get<int>("@oTOTAL_RECORDS").ToInt32OrDefault();
                employeeProfiles = dbScreenInformations.ToList();
            }
            profiles = new PagedResultSet<EmployeeProfileData>()
            {
                Items = employeeProfiles,
                PageIndex = searchCriteria.StartIndex,
                PageSize = searchCriteria.EndIndex,
                TotalItems = totalRecords,
            };
            return profiles;
        }

        public async Task<EmployeeProfileData> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfileData employeeProfile = null;
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add(name: "IEMPLOYEEID", employeeId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                employeeProfile = await connection.QueryFirstOrDefaultAsync<EmployeeProfileData>(DatabaseProcedures.SP_GET_NSL_EMPLOYEE_PROFILE, parameters, commandType: CommandType.StoredProcedure);
            }
            return employeeProfile;
        }
    }
}
