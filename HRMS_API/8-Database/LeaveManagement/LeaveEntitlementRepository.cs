using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;

using Oracle.ManagedDataAccess.Client;

using Phoenix.CrossCutting.Extension.Dapper;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.LeaveManagement;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.LeaveManagement
{
    public class LeaveEntitlementRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;
        public LeaveEntitlementRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveEntitlement>> GetLeaveEntitlement(GetEmployeeLeaveEntitlementReq employeeLeaveEntitlementReq)
        {
            List<LeaveEntitlement> entitlement = null;
            string BranchSlnotring = string.Join(",", employeeLeaveEntitlementReq.BranchSlno);
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iOFFICE_TYPE_SLNO", employeeLeaveEntitlementReq.OfficeTypeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iBRANCH_SLNO", employeeLeaveEntitlementReq.BranchSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeLeaveEntitlementReq.BranchSlno.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iLEAVE_TYPE_ID", employeeLeaveEntitlementReq.LeaveTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                entitlement = (await connection.QueryAsync<LeaveEntitlement>(DatabaseProcedures.SP_GET_LEAVE_ENTITLEMENT, parameters, commandType: CommandType.StoredProcedure)).ToList();
                entitlement = entitlement.OrderByDescending(x => x.EmpId).ToList();
            }
            return entitlement;
        }
        public async Task<bool> UpdateLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements)
        {
            bool resp = false;
            int updatedRecords = 0;
            List<LeaveEntitlement> oldLeaveEntitlements = null;
            List<LeaveEntitlement> newleaveEntitlements = null;
            OracleDynamicParameters parameters = null;

            foreach (var item in leaveEntitlements)
            {
                item.RowVersion = Guid.NewGuid().ToString();
                //item.CreatedDate = item.EmployeeLeaveEntitlementId <= 0 ? DateTime.Now : item.CreatedDate;
                //item.UpdatedDate = item.EmployeeLeaveEntitlementId > 0 ? DateTime.Now : null;
                //item.CreatedBy = item.EmployeeLeaveEntitlementId <= 0 ?? item.CreatedBy;
            }


            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEE_LEAVE_ENTITLEMENT_ID", leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iEMPLOYEESLNO", leaveEntitlements.Select(x => x.EmployeeSlno).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iLEAVE_INFORMATION_ID", leaveEntitlements.Select(x => x.LeaveInformationId).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iYEAR_OF_LEAVE", leaveEntitlements.Select(x => x.LeaveYear).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDATE_VALID_FROM", leaveEntitlements.Select(x => x.DateValidFrom).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iDATE_VALID_UNTIL", leaveEntitlements.Select(x => x.DateValidUntil).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iTOTAL_LEAVES", leaveEntitlements.Select(x => x.TotalLeaves).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iCONSUMED_LEAVES", leaveEntitlements.Select(x => x.ConsumedLeaves).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iENCASHED_LEAVES", leaveEntitlements.Select(x => x.EncashedLeaves).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                  collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iNEWENCASHED_LEAVES", leaveEntitlements.Select(x => x.NewEncashedLeaves).ToArray(), dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iROW_VERSION", leaveEntitlements.Select(x => x.RowVersion).ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iCREATED_BY", leaveEntitlements.Select(x => x.CreatedBy).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //parameters.Add(name: "iCREATED_DATE", leaveEntitlements.Select(x => x.CreatedDate).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                //    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //parameters.Add(name: "iUPDATED_BY", leaveEntitlements.Select(x => x.UpdatedBy).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                //   collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                //parameters.Add(name: "iUPDATED_DATE", leaveEntitlements.Select(x => x.UpdatedDate).ToArray(), dbType: OracleMappingType.Date, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                //    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                parameters.Add(name: "iORI_TOTAL_LEAVES", leaveEntitlements.Select(x => x.OriTotalLeaves).ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, leaveEntitlements.Select(x => x.EmployeeLeaveEntitlementId).Count(),
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_SAVE_LEAVE_ENTITLEMENT, parameters, commandType: CommandType.StoredProcedure);
            }
            resp = updatedRecords * -1 > 0;
            return resp;
        }

        public async Task<bool> SaveLeaveEntitlement(List<LeaveEntitlement> leaveEntitlements)
        {
            bool resp = false;
            int updatedRecords = 0;
            List<LeaveEntitlement> oldLeaveEntitlements = null;
            List<LeaveEntitlement> newleaveEntitlements = null;
            OracleDynamicParameters parameters = new OracleDynamicParameters();
            oldLeaveEntitlements = leaveEntitlements.Where(x => x.EmployeeLeaveEntitlementId != 0).ToList();
            newleaveEntitlements = leaveEntitlements.Where(x => x.EmployeeLeaveEntitlementId == 0).ToList();
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {



                //            parameters.Add(name: "iBRANCH_SLNO", employeeLeaveEntitlementReq.BranchSlno.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeLeaveEntitlementReq.BranchSlno.Count,
                //collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);


                //OracleDynamicParameters parameters = new OracleDynamicParameters();
                //parameters.Add(name: "IEMPLOYEE_LEAVE_ENTITLEMENT_ID", updateEmployeeLeaveEntitlementReq.EmployeeLeaveEntitlementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                //// parameters.Add(name: "IEMPLOYEESLNO", updateEmployeeLeaveEntitlementReq.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                //parameters.Add(name: "ITOTAL_LEAVES", updateEmployeeLeaveEntitlementReq.TotalLeaves, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                //parameters.Add(name: "IDATE_VALID_FROM", updateEmployeeLeaveEntitlementReq.FromDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                //parameters.Add(name: "IDATE_VALID_UNTIL", updateEmployeeLeaveEntitlementReq.ToDate, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);
                //parameters.Add(name: "ISTATUS_ID", updateEmployeeLeaveEntitlementReq.StatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                //parameters.Add(name: "IUPDATEDBY", updateEmployeeLeaveEntitlementReq.UpdatedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                //updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_LEAVE_ENTITLEMENT, parameters, commandType: CommandType.StoredProcedure);
            }
            resp = updatedRecords * -1 > 0;
            return resp;
        }

        public async Task<bool> DeleteLeaveEntitlement(DeleteEmployeeLeaveEntitlementReq deleteEmployeeLeaveEntitlementReq)
        {
            bool resp = false;
            int updatedRecords = 0;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "IEMPLOYEE_LEAVE_ENTITLEMENT_ID", deleteEmployeeLeaveEntitlementReq.EmployeeLeaveEntitlementId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IUPDATEDBY", deleteEmployeeLeaveEntitlementReq.UpdatedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IEMPLOYEESLNO", deleteEmployeeLeaveEntitlementReq.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);

                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_LEAVE_ENTITLEMENT, parameters, commandType: CommandType.StoredProcedure);
            }
            resp = updatedRecords * -1 > 0;
            return resp;
        }
    }
}
