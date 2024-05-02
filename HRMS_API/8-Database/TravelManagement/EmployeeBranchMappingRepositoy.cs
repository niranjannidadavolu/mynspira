using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.InvestmentProofs;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.States;
using Phoenix.Model.Business.TravelManagement;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.TravelManagement
{
    public class EmployeeBranchMappingRepositoy : BaseRepository
    {
        private readonly IConfiguration configuration;
        public EmployeeBranchMappingRepositoy(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LocationMappingDetail>> GetEmployeeBranchMappings(int employeeSlno)
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

        public async Task<bool> SaveLocationMappingDetails(List<LocationMappingDetail> locationDetails)
        {
            bool isSaved = false;
            int savedRecords = 0;
            //using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            //{
            //    OracleDynamicParameters parmeters = new OracleDynamicParameters();
            //    parmeters.Add(name: "iLOCATION_ID", locationDetail.LocationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            //    parmeters.Add(name: "iLOCATION_NAME", locationDetail.LocationName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
            //    parmeters.Add(name: "iSTATUS_ID", RecordStatus.Active.ToInt32OrDefault(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
            //    parmeters.Add(name: "iEMPLOYEESLNO", locationDetail.EmployeeSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
            //    savedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_FROM_LOCATION, parmeters, commandType: CommandType.StoredProcedure);
            //}
            isSaved = (savedRecords * -1) > 0;
            return isSaved;
        }

        public async Task<EmployeeBranchMapping> GetAllEmployeeBranchMappings()
        {
            EmployeeBranchMapping assignBranch = null;
            List<LocationMappingDetail> locationDetails = null;
            List<EmployeeProfile> employeeProfiles = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", 0, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPLOYEEDATA", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.GET_EMPLOYEE_LOCATION, parameters, commandType: CommandType.StoredProcedure);
                locationDetails = results.Read<LocationMappingDetail>().ToList();
                employeeProfiles = results.Read<EmployeeProfile>().ToList();
            }
            assignBranch = new EmployeeBranchMapping(locationDetails, employeeProfiles);
            return assignBranch;
        }

        public async Task<bool> MapSelectedBranchesToEmployee(AssignBranch assignBranches)
        {
            bool isSaved = false;
            foreach (LocationMappingDetail selectedBranch in assignBranches.SelectedBranches)
            {
                selectedBranch.Employeeslno = assignBranches.EmployeeSlNo;
                selectedBranch.CreatedBy = assignBranches.CreatedByUserId;
            }
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iRECORD_ID", assignBranches.SelectedBranches.Select(x => x.RecordId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iEMPLOYEESLNO", assignBranches.SelectedBranches.Select(x => x.Employeeslno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iLOCATIONSLNO", assignBranches.SelectedBranches.Select(x => x.FromLocationId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iMAPPING_BRANCH_SLNO", assignBranches.SelectedBranches.Select(x => x.ToBranchId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iMOTHER_BRANCH_ID", assignBranches.SelectedBranches.Select(x => x.MotherBranchId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTOTAL_DISTANCE", assignBranches.SelectedBranches.Select(x => x.Distance).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iAUTO_FARE", assignBranches.SelectedBranches.Select(x => x.AutoFare).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTICKET_FARE", assignBranches.SelectedBranches.Select(x => x.TicketFare).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDA_AMOUNT", assignBranches.SelectedBranches.Select(x => x.DaAmount).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iSTATUS_ID", assignBranches.SelectedBranches.Select(x => x.StatusId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iCREATED_BY", assignBranches.SelectedBranches.Select(x => x.CreatedBy).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranches.SelectedBranches.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                int savedRowCount = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_EMPLOYEE_BRANCH, parameters, commandType: CommandType.StoredProcedure);
                isSaved = (savedRowCount * -1 )> 0;
            }
            return isSaved;
        }
    }
}
