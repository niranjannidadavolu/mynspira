using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.InvestmentProofs;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.States;
using Phoenix.Model.Business.TravelManagement;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.TravelManagement
{
    public class LocationdetailRepository : BaseRepository
    {
        private readonly IConfiguration _configuration;
        public LocationdetailRepository(IConfiguration configuration) : base(configuration)
        {
            this._configuration = configuration;
        }

        public async Task<PagedResultSet<LocationDetail>> GetTravelLocationDetails(TravelLocationSearchCriteria searchCriteria)
        {
            PagedResultSet<LocationDetail> locationDetails = null;
            IEnumerable<LocationDetail> dbLocations = null;
            int totalRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add(name: "iLOCATION_NAME", searchCriteria.LocationName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iSTART_INDEX", searchCriteria.StartIndex, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iEND_INDEX", searchCriteria.EndIndex, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oTOTAL_RECORDS", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                dbLocations = await connection.QueryAsync<LocationDetail>(DatabaseProcedures.SP_GET_ALL_FROM_LOCATIONS, parameters, commandType: CommandType.StoredProcedure);
                totalRecords = parameters.Get<int>("@oTOTAL_RECORDS").ToInt32OrDefault();
            }
            locationDetails = new PagedResultSet<LocationDetail>()
            {
                Items = dbLocations.ToList<LocationDetail>(),
                PageIndex = searchCriteria.StartIndex,
                PageSize = searchCriteria.EndIndex,
                TotalItems = totalRecords,
            };
            return locationDetails;

        }

        public async Task<bool> SaveLocationDetails(LocationDetail locationDetail)
        {
            bool isSaved = false;
            int savedRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iLOCATION_ID", locationDetail.LocationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iLOCATION_NAME", locationDetail.LocationName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parmeters.Add(name: "iSTATUS_ID", RecordStatus.Active.ToInt32OrDefault(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parmeters.Add(name: "iEMPLOYEESLNO", locationDetail.EmployeeSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                savedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_FROM_LOCATION, parmeters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (savedRecords * -1) > 0;
            return isSaved;
        }

        public async Task<List<LocationDetail>> GetTravelLocations()
        {
            List<LocationDetail> locationDetails = null;
            IEnumerable<LocationDetail> dbLocations = null;
            int totalRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                string templateid = ApplicationSettings.Current.HrmsOtpTemplate;
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                locationDetails = (await connection.QueryAsync<LocationDetail>(DatabaseProcedures.SP_GET_FROM_LOCATIONS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return locationDetails;
        }
    }
}
