using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
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
    public class KraInformationRepositry : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache rediscache;

        public KraInformationRepositry(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<bool> SaveKraInformation(KraInformation KraInformation)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            //DateTime date = DateTime.Now;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iKRASLNO", KraInformation.KraSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iKRANAME", KraInformation.KraName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iDESCRIPTION", KraInformation.Description, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "iCREATEDBY", KraInformation.ModifiedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_SAVE_KRA_INFORMATION, parameters, commandType: CommandType.StoredProcedure);
            }
            isSaved = (rowsInserted * -1) > 0;
            return isSaved;
        }

        public async Task<List<KraInformation>> GetAllKraInformations()
        {
            List<KraInformation> kraInformations = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                kraInformations = (await connection.QueryAsync<KraInformation>(PerformanceManagement.SP_GET_ALL_KRA_INFORMATIONS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return kraInformations;
        }
        
        public async Task<bool> DeleteKRAInformation(string kraSlno)
        {
            bool isDeleted = false;
            OracleDynamicParameters parameters = null;
            int rowsInserted = 0;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iKRASLNO", kraSlno, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                rowsInserted = await connection.ExecuteAsync(PerformanceManagement.SP_KRA_DELETE, parameters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (rowsInserted * -1) > 0;
            return isDeleted; 
        }

        public async Task<bool> CheckDuplicateKra(int kraSlno, string kraName)
        {
            int existingCount = 0;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iKRASLNO", kraSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iKRANAME", kraName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parameters.Add(name: "oRECORD_COUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);
                existingCount = await connection.ExecuteScalarAsync<int>(PerformanceManagement.SP_CHECK_FOR_DUPLICATE_KRA, parameters, commandType: CommandType.StoredProcedure);
                existingCount = parameters.Get<int>("oRECORD_COUNT");
            }
            return existingCount > 0;
        }

        public async Task<List<DesignationKraInformation>> GetAllPendingInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                kraInformations = (await connection.QueryAsync<DesignationKraInformation>(PerformanceManagement.SP_GET_PENDING_INIT_REVIEWS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return kraInformations;
        }

        public async Task<List<DesignationKraInformation>> GetAllFinalInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                kraInformations = (await connection.QueryAsync<DesignationKraInformation>(PerformanceManagement.SP_GET_FINAL_INIT_REVIEWS, parameters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return kraInformations;
        }
    }
}
