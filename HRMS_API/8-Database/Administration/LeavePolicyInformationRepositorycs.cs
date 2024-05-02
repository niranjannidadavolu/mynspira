using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Administration
{
    public class LeavePolicyInformationRepositorycs : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public LeavePolicyInformationRepositorycs(IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<LeavePolicyInformation>> GetLeavePolicyInformation()
        {
            List<LeavePolicyInformation> empLeaves = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empLeaves = (await connection.QueryAsync<LeavePolicyInformation>(DatabaseProcedures.GET_LEAVE_POLICY_INFORMATION, parameters, commandType: CommandType.StoredProcedure)).ToList();
                empLeaves = empLeaves.OrderByDescending(x => x.PolicyName).ToList();
            }
            return empLeaves;
        }

        public async Task<bool> SaveLeavePolicyInformation(LeavePolicyInformation leavePolicyInformationDetails)
        {
            bool isSaved = false;
            //int leavePolicyInformationSave = 0;
            OracleDynamicParameters parameters = null;
            int rowInserted = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "IPOLICY_NAME", leavePolicyInformationDetails.PolicyName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "ILOWER_BOUND", leavePolicyInformationDetails.LowerBound, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IUPPER_BOUND", leavePolicyInformationDetails.UpperBound, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IAPPLY_BEFORE_DAYS", leavePolicyInformationDetails.ApplyBeForeDays, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IMAX_CONCECUTIVE_DAYS", leavePolicyInformationDetails.MaxConcecutiveDays, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IALLOW_AFTER_MAX_CONCECUTIVE", leavePolicyInformationDetails.AllowAfter_MaxConcecutive, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IACCRUAL_RATE", leavePolicyInformationDetails.AccrualRate, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "INEED_CERTIFICATE", leavePolicyInformationDetails.NeedCertificate, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ICONSIDER_WEEKENDS_HOLIDAYS", leavePolicyInformationDetails.ConsiderWeekendsHolidays, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IMAXIMUM_USAGE", leavePolicyInformationDetails.MaximumUsage, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ICAN_BE_MERGED_WITH_OTHER", leavePolicyInformationDetails.CanBeMergedWithOther, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IAPPLICABLE_TO", leavePolicyInformationDetails.ApplicableTo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ICAN_APPLY_HALF_DAY", leavePolicyInformationDetails.CanApplyHalfDay, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ISTATUS_ID", leavePolicyInformationDetails.StatusID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR ", leavePolicyInformationDetails.Rowversion, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                rowInserted = await connection.ExecuteAsync(DatabaseProcedures.SP_INSERT_POLICY_INFOMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowInserted * -1) > 0;
            return isSaved;
        }

        public async Task<bool> UpdateLeavePolicyInformation(LeavePolicyInformationReq leavePolicyInformationDetails)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsUpdated = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {

                parameters = new OracleDynamicParameters();
                parameters.Add(name: "IPOLICY_ID", leavePolicyInformationDetails.PolicyID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IPOLICY_NAME", leavePolicyInformationDetails.PolicyName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "ILOWER_BOUND", leavePolicyInformationDetails.LowerBound, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IUPPER_BOUND", leavePolicyInformationDetails.UpperBound, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IAPPLY_BEFORE_DAYS", leavePolicyInformationDetails.ApplyBeForeDays, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IMAX_CONCECUTIVE_DAYS", leavePolicyInformationDetails.MaxConcecutiveDays, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IALLOW_AFTER_MAX_CONCECUTIVE", leavePolicyInformationDetails.AllowAfter_MaxConcecutive, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IACCRUAL_RATE", leavePolicyInformationDetails.AccrualRate, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "INEED_CERTIFICATE", leavePolicyInformationDetails.NeedCertificate, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ICONSIDER_WEEKENDS_HOLIDAYS", leavePolicyInformationDetails.ConsiderWeekendsHolidays, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ICAN_BE_MERGED_WITH_OTHER", leavePolicyInformationDetails.CanBeMergedWithOther, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IMAXIMUM_USAGE", leavePolicyInformationDetails.MaximumUsage, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "IAPPLICABLE_TO", leavePolicyInformationDetails.ApplicableTo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ICAN_APPLY_HALF_DAY", leavePolicyInformationDetails.CanApplyHalfDay, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "ISTATUS_ID", leavePolicyInformationDetails.StatusID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR ", leavePolicyInformationDetails.Rowversion, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);

                rowsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_POLICY_INFOMATION, parameters, commandType: CommandType.StoredProcedure);

            }
            isSaved = (rowsUpdated * -1) > 0;
            return isSaved;
        }
        public async Task<bool> DeleteLeavePolicyInformation(int policyID)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsDeleted = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {

                parameters = new OracleDynamicParameters();
                parameters.Add(name: "IPOLICY_ID", policyID, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                rowsDeleted = await connection.ExecuteAsync(DatabaseProcedures.SP_DELETE_POLICY_INFOMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsDeleted * -1) > 0;
            return isSaved;
        }


    }
}
