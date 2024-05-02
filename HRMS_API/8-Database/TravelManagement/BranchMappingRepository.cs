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
    public class BranchMappingRepository : BaseRepository
    {
        private readonly IConfiguration _configuration;
        public BranchMappingRepository(IConfiguration configuration) : base(configuration)
        {
            this._configuration = configuration;
        }

        public async Task<List<LocationMappingDetail>> LoadAllBranchMappings()
        {
            List<LocationMappingDetail> locationDetails = null;
            IEnumerable<LocationMappingDetail> dbLocations = null;
            int totalRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                dbLocations = await connection.QueryAsync<LocationMappingDetail>(DatabaseProcedures.SP_GET_ALL_LOCATION_MAPPINGS, parameters, commandType: CommandType.StoredProcedure);
            }
            locationDetails = dbLocations.ToList();
            return locationDetails;

        }

        public async Task<bool> SaveBranchMappings(List<LocationMappingDetail> locationDetails)
        {
            bool isSaved = false;
            int savedRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                foreach (LocationMappingDetail locationMappingDetail in locationDetails)
                {
                    OracleDynamicParameters parameters = new OracleDynamicParameters();
                    parameters.Add(name: "iLOCATION_MAPPING_ID", locationMappingDetail.LocationMappingId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iSTATE_ID", locationMappingDetail.StateId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iDISTRICT_ID", locationMappingDetail.DistrictId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iFROM_LOCATION_ID", locationMappingDetail.FromLocationId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTO_LOCATION_ID", locationMappingDetail.ToBranchId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iMOTHER_BRANCH_ID", locationMappingDetail.MotherBranchId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iIS_LOCAL", locationMappingDetail.IsLocal.ToInt32OrDefault(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iDISTANCE", locationMappingDetail.Distance, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iAUTO_FARE", locationMappingDetail.AutoFare, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTICKET_FARE", locationMappingDetail.TicketFare, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iDA_AMOUNT", locationMappingDetail.DaAmount, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iCREATED_BY", locationMappingDetail.Employeeslno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

                    int dbSavedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_LOCATION_MAPPINGS, parameters, commandType: CommandType.StoredProcedure);
                    savedRecords += dbSavedRecords;
                }
            }
            isSaved = (savedRecords * -1) > 0;
            return isSaved;
        }

        public async Task<List<LocationMappingDetail>> GetMappedLocationsByLocationId(int fromLocationId)
        {
            List<LocationMappingDetail> locationDetails = null;
            IEnumerable<LocationMappingDetail> dbLocations = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iFROM_LOCATION_ID", fromLocationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                dbLocations = await connection.QueryAsync<LocationMappingDetail>(DatabaseProcedures.SP_GET_MAPPED_LOCATIONS, parameters, commandType: CommandType.StoredProcedure);
            }
            locationDetails = dbLocations.ToList();
            return locationDetails;
        }
    }
}
