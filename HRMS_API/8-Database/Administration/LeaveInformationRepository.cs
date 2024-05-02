
﻿using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.CrossCutting.TimePeriod;
using Phoenix.Infrastructure.Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
 using Phoenix.Model.Business.Administration;
 using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Administration
{
    public class LeaveInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;
        public LeaveInformationRepository(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveInformation>> GetLeaveInformation()
        {
            List<LeaveInformation> leavesInfo = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                leavesInfo = (await connection.QueryAsync<LeaveInformation>(DatabaseProcedures.GET_LEAVE_INFORMATION, parameters, commandType: CommandType.StoredProcedure)).ToList();
                leavesInfo = leavesInfo.OrderByDescending(x => x.LeaveInformationName).ToList();
            }
            return leavesInfo;
        }

        public async Task<bool> UpdateLeaveInformation(LeaveInformationSaveReq leaveInformation)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsUpdated = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {

                parameters = new OracleDynamicParameters();
                parameters.Add(name: "ILEAVE_INFORMATION_ID", leaveInformation.LeaveInformationID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_INFORMATION_NAME", leaveInformation.LeaveInformationName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_TYPE_ID", leaveInformation.LeaveTypeID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_POLICY_ID", leaveInformation.LeavePolicyID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IOFFICE_TYPE_SLNO", leaveInformation.OfficeTypeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IBRANCH_SLNO", leaveInformation.BranchSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ISTATUS_ID", leaveInformation.StatusID, dbType: OracleMappingType.Int16, direction: ParameterDirection.Input);
                rowsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_LEAVE_INFOMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsUpdated * -1) > 0;
            return isSaved;
        }
        private DateTime CreatedDate = DateTime.Now;
        public async Task<bool> SavedLeaveInformation(LeaveInformationSaveReq leaveInformation)
        {
           
              bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            //DateTime date = DateTime.Now;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "ILEAVE_INFORMATION_NAME", leaveInformation.LeaveInformationName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_TYPE_ID", leaveInformation.LeaveTypeID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ILEAVE_POLICY_ID", leaveInformation.LeavePolicyID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IOFFICE_TYPE_SLNO", leaveInformation.OfficeTypeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IBRANCH_SLNO", leaveInformation.BranchSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ISTATUS_ID", leaveInformation.StatusID, dbType: OracleMappingType.Int16, direction: ParameterDirection.Input);
                rowsInserted = await connection.ExecuteAsync(DatabaseProcedures.SP_INSERT_LEAVE_INFOMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsInserted * -1) > 0;
            return isSaved;
        }
        public async Task<bool> DeleteLeaveInformation(int leaveInformationId)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsDeleted = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {

                parameters = new OracleDynamicParameters();
                parameters.Add(name: "ILEAVE_INFORMATION_ID", leaveInformationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                rowsDeleted = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_LEAVE_INFOMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsDeleted * -1) > 0;
            return isSaved;
        }
        public async Task<List<LeaveTypeInformation>> GetLeaveInformationByOfc(int officeTypeSlno, int? branchSlno)
        {
            List<LeaveTypeInformation> leavesInfo = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "IOFFICETYPESLNO", officeTypeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IBRANCHSLNO", branchSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                leavesInfo = (await connection.QueryAsync<LeaveTypeInformation>(DatabaseProcedures.SP_GET_LEAVE_TYPES_BY_OFC, parameters, commandType: CommandType.StoredProcedure)).ToList();
                leavesInfo = leavesInfo.OrderByDescending(x => x.LeaveInformationId).ToList();
            }
            return leavesInfo;
        }
    }
}
