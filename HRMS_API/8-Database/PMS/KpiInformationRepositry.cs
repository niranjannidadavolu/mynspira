using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.PMS
{
    public class KpiInformationRepositry: BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache rediscache;

        public KpiInformationRepositry(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<bool> SaveKpiInformation(KpiInformation KpiInformation)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iKPISLNO", KpiInformation.KpiSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iKPINAME", KpiInformation.KpiName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iDESCRIPTION", KpiInformation.Description, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iMEASUREMENT", KpiInformation.Measurement, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iMIN_THRESHOLD_VALUES", KpiInformation.MinThresholdValues, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iMAX_THRESHOLD_VALUES", KpiInformation.MaxThresholdValues, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iKRASLNO", KpiInformation.KraSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iFREQUENCY_SLNO", KpiInformation.FrequencySlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iCREATED_BY", KpiInformation.CreatedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_SAVE_KPI_INFORMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsInserted * -1) > 0;
            return isSaved;
        }

        public async Task<List<KpiInformation>> GetAllKpiInformations()
        {
            List<KpiInformation> kpiInformations = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                kpiInformations = (await connection.QueryAsync<KpiInformation>(PerformanceManagement.SP_GET_ALL_KPI_INFORMATIONS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return kpiInformations;
        } 
        public async Task<bool> DeleteKpiInformation(int kpiId)
        {
            bool isDeleted = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            List<int> kpiInformations = null;

            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                kpiInformations = new List<int> { kpiId };

                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iKPISLNO", kpiInformations.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, kpiInformations.Count,
                    collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_DELETE_KPI_INFORMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (rowsInserted * -1) > 0;
            return isDeleted;
        }
        public async Task<bool> CheckDuplicateKpi(int kpiId, string kpiName)
        {
            int existingCount = 0;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iKPI_SLNO", kpiId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iKPI_NAME", kpiName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "oRECORD_COUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                existingCount = await connection.ExecuteScalarAsync<int>(PerformanceManagement.SP_CHECK_FOR_DUPLICATE_KPI, parameters, commandType: CommandType.StoredProcedure);
                existingCount = parameters.Get<int>("oRECORD_COUNT");
            }
            return existingCount > 0;
        }
    }
}
