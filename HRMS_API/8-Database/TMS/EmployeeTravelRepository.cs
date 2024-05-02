using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.TimeSheet;
using Phoenix.Model.Business.TMS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Enumerations;

namespace Phoenix.Database.Repository.TMS
{
    public class EmployeeTravelRepository : BaseRepository
    {
        private readonly IConfiguration _configuration;
        public EmployeeTravelRepository(IConfiguration configuration) : base(configuration)
        {
            this._configuration = configuration;
        }
        public async Task<List<TravelDetails>> GetEmployeeTravelDetails()
        {
            List<TravelDetails> travelDetails = null;

            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                travelDetails = (await connection.QueryAsync<TravelDetails>(DatabaseProcedures.GET_EMPLOYEES_FOR_TRAVEL, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return travelDetails;
        }
        public async Task<List<LocationDetails>> GetFromLocationDetails(int? employeeSlno)
        {
            List<LocationDetails> locationDetails = null;
            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                //   parmeters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                locationDetails = (await connection.QueryAsync<LocationDetails>(DatabaseProcedures.GET_FROM_LOCATION, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return locationDetails;
        }
        public async Task<List<ToLocationDetails>> GetToLocationDetails(int? fromlocationid)
        {
            List<ToLocationDetails> toLocationDetails = null;

            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                 parmeters.Add(name: "iFROMLOCATIONID", fromlocationid, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                // parmeters.Add(name: "iBRANCHSLNO", Branchslno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                toLocationDetails = (await connection.QueryAsync<ToLocationDetails>(DatabaseProcedures.GET_TO_LOCATION_MAPPING_MT, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return toLocationDetails;
        }
        public async Task<List<Location>> GetEmployeeLocation(int employeeSlno)
        {
            List<LocationDetails> fromLocationDetails = null;
            List<ToLocationDetails> toLocationDetails = null;
            List<Location> locations = new List<Location>();
            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "EMPLOYEEDATA", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(DatabaseProcedures.GET_EMPLOYEE_LOCATION, parameters, commandType: CommandType.StoredProcedure);
                fromLocationDetails = results.Read<LocationDetails>().ToList();
                toLocationDetails = results.Read<ToLocationDetails>().ToList();
                Location location = new Location
                {
                    FromLocation = fromLocationDetails,
                    ToLocation = toLocationDetails
                };
                locations.Add(location);
            }

            return locations;
        }
        public async Task<List<AssignBranchDetails>> GetEmployeeMappedBranchesDetails(int employeeslno)
        {
            List<AssignBranchDetails> assignBranchDetails = null;
            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeslno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                assignBranchDetails = (await connection.QueryAsync<AssignBranchDetails>(DatabaseProcedures.GET_BRANCH_MAPPING_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return assignBranchDetails;
        }
        public async Task<bool> SaveBranchMappingDetails(List<AssignBranchDetails> assignBranchDetails)
        {
            bool resp = false;
            int updatedRecords = 0;
            OracleDynamicParameters parameters = null;
            using (var connection = await CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iRECORD_ID", assignBranchDetails.Select(x => x.RecordId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.RecordId).Count(),
                     collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iEMPLOYEESLNO", assignBranchDetails.Select(x => x.Employeeslno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.Employeeslno).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iLOCATIONSLNO", assignBranchDetails.Select(x => x.Locationslno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.Locationslno).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iMAPPING_BRANCH_SLNO", assignBranchDetails.Select(x => x.MappingBranchSlno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.MappingBranchSlno).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iMOTHER_BRANCH_ID", assignBranchDetails.Select(x => x.MotherBranchId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.MotherBranchId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTOTAL_DISTANCE", assignBranchDetails.Select(x => x.TotalDistance).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.TotalDistance).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iAUTO_FARE", assignBranchDetails.Select(x => x.AutoFare).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.AutoFare).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTICKET_FARE", assignBranchDetails.Select(x => x.TicketFare).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.TicketFare).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDA_AMOUNT", assignBranchDetails.Select(x => x.DAAmount).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.DAAmount).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iSTATUS_ID", assignBranchDetails.Select(x => x.StatusId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.StatusId).Count(),
                  collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iCREATED_BY", assignBranchDetails.Select(x => x.CreatedBy).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.CreatedBy).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iCREATED_DATE", assignBranchDetails.Select(x => x.CreatedDate).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.CreatedDate).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iUPDATED_BY", assignBranchDetails.Select(x => x.UpdatedBy).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.UpdatedBy).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iUPDATED_DATE", assignBranchDetails.Select(x => x.UpdatedDate).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, assignBranchDetails.Select(x => x.UpdatedDate).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_EMPLOYEE_BRANCH_MAPPING, parameters, commandType: CommandType.StoredProcedure);
            }
            resp = updatedRecords * -1 > 0;
            return resp;
        }
        public async Task<bool> DeleteBranchMappingDetails(int recordID)
        {

            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            //DateTime date = DateTime.Now;
            using (IDbConnection connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iRECORD_ID", recordID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                rowsInserted = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_BRANCHMAPPING, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsInserted * -1) > 0;
            return isSaved;
        }
        public async Task<bool> DeleteVisitPlanEmployeDetails(int travelID)
        {
            bool isDeleted = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            using (IDbConnection connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iTRAVELID", travelID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                rowsInserted = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_VISITDETAILS, parameters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (rowsInserted * -1) > 0;
            return isDeleted;
        }
        public async Task<List<CreatePlanDetails>> GetApprovalVisitPlan(int employeeSlno)
        {
            List<CreatePlanDetails> createPlanDetails = null;
            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                createPlanDetails = (await connection.QueryAsync<CreatePlanDetails>(DatabaseProcedures.GET_EMPLOYEE_TRAVEL_MT_DETAILS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return createPlanDetails;
        }
        public async Task<List<CreatePlanDetails>> GetEmployeeTravelByID(int traverID)
        {
            List<CreatePlanDetails> createPlanDetails = null;
            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iTRAVELID", traverID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                createPlanDetails = (await connection.QueryAsync<CreatePlanDetails>(DatabaseProcedures.GET_EMPLOYEE_TRAVEL_DT_BYID, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return createPlanDetails;
        }
        public async Task<List<CreatePlanDetails>> GetEmployeeApporvalTravelByID(int travelID, int employeeSlno) 
        {
            List<CreatePlanDetails> createPlanDetails = null;
            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iTRAVELID", travelID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                createPlanDetails = (await connection.QueryAsync<CreatePlanDetails>(DatabaseProcedures.GET_EMP_APPROVAL_TRAVEL_BYID, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return createPlanDetails;
        }
        public async Task<bool> SaveVisitPlanDetails(List<CreatePlanDetails> createPlanDetails)
        {
            bool resp = false;
            int updatedRecords = 0;
            using (var connection = await CreateConnection(Enumerations.DbSchema.PORTAL))
            {

                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iTRAVEL_ID", createPlanDetails.Select(x => x.TravelID).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.TravelID).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTRAVEL_CODE", createPlanDetails.Select(x => x.TravelCode).ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.TravelCode).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTRAVEL_DATE", createPlanDetails.Select(x => x.TravelDate).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.TravelDate).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iEMPLOYEESLNO", createPlanDetails.Select(x => x.EmployeeSlno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.EmployeeSlno).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iROW_VERSION", createPlanDetails.Select(x => x.RowVersion).ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.RowVersion).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iSTATUS_ID", createPlanDetails.Select(x => x.StatusID).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.StatusID).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //parameters.Add(name: "iCREATED_BY", createPlanDetails.Select(x => x.EmployeeSlno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.EmployeeSlno).Count(),
                //collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iAPPROVED_BY", createPlanDetails.Select(x => x.ApprovedBy).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.ApprovedBy).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //parameters.Add(name: "iAPPROVED_DATE", createPlanDetails.Select(x => x.ApprovedDate).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.ApprovedDate).Count(),
                //collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iAPPROVED_REMARKS", createPlanDetails.Select(x => x.ApprovedRemarks).ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.ApprovedRemarks).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iLOCATIONSLNO", createPlanDetails.Select(x => x.LocationSlno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.LocationSlno).Count(),
                 collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iBRANCHSLNO", createPlanDetails.Select(x => x.BranchSlno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.BranchSlno).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
              //  parameters.Add(name: "iTOTAL_DISTANCE", createPlanDetails.Select(x => x.TotalDistance).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.TotalDistance).Count(),
              //   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iAUTO_FARE", createPlanDetails.Select(x => x.AutoFare).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.AutoFare).Count(),
                 collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTICKET_FARE", createPlanDetails.Select(x => x.TicketFare).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.TicketFare).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDA_AMOUNT", createPlanDetails.Select(x => x.DAAmount).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, createPlanDetails.Select(x => x.DAAmount).Count(),
                collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.INSERT_TRAVEL_PLAN, parameters, commandType: CommandType.StoredProcedure);
            }
            resp = updatedRecords * -1 > 0;
            return resp;
        }
        public async Task<bool> UpdateEmployeeVisitiApproval(CreatePlanDetails  updatePlanDetails)
        {
            bool resp = false;
            int updatedRecords = 0;

            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iTRAVELID", updatePlanDetails.TravelID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iSTATUSID", updatePlanDetails.StatusID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
              //  parameters.Add(name: "iAPPROVED_BY", updatePlanDetails.ApprovedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iAPPROVED_REMARKS", updatePlanDetails.ApprovedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_VISIT_APPROVEDETAILS, parameters, commandType: CommandType.StoredProcedure);
            }
            resp = (updatedRecords * -1) > 0;
            return resp;
        }
        public async Task<List<EmployeeToLocation>> GetEmployeeToLocationByID(int fromLocationid)
        {
            List<EmployeeToLocation> tolocations= null;
            using (var connection = await base.CreateConnection(Enumerations.DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
               // parameters.Add(name: "iTRAVELID", travelID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iFROMLOCATIONID", fromLocationid, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                tolocations = (await connection.QueryAsync<EmployeeToLocation>(DatabaseProcedures.SP_GET_TOLOCATION_MAPPING_MT, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return tolocations;
        }

    }
}
