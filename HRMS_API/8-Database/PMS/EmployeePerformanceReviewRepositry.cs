using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.LeaveManagementReports;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Phoenix.CrossCutting.Enumerations;

namespace Phoenix.Database.Repository.PMS
{
    public class EmployeePerformanceReviewRepositry : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache rediscache;

        public EmployeePerformanceReviewRepositry(IConfiguration configuration, IDistributedCache redisCache) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<EmployeeReviewInformation> GetEmployeeReviewInformation(int kraInformationId)
        {
            EmployeeReviewInformation employeeReviewInformation = null;
            List<EmployeeReviewDetail> employeeReviewDetails = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iREVIEW_ID", value: kraInformationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parameters.Add(name: "oKPI_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var results = await connection.QueryMultipleAsync(PerformanceManagement.SP_GET_EMPLOYEE_KRA_INFO, parameters, commandType: CommandType.StoredProcedure);
                employeeReviewInformation = results.ReadFirstOrDefault<EmployeeReviewInformation>();
                employeeReviewDetails = results.Read<EmployeeReviewDetail>().ToList();
                if (employeeReviewInformation != null)
                {
                    employeeReviewInformation.EmployeeReviewDetails = employeeReviewDetails;
                }
            }
            return employeeReviewInformation;
        }

        public async Task<List<EmployeeReviewInformation>> GetEmployeeReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> employeeReviewInformations = null;

            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", value: employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                var results = await connection.QueryAsync<EmployeeReviewInformation>(PerformanceManagement.SP_GET_EMPLOYEE_REVIEWS, parameters, commandType: CommandType.StoredProcedure);
                employeeReviewInformations = results.ToList();
                return employeeReviewInformations;
            }
        }
        public async Task<List<EmployeeReviewDetail>> GetEmployeePendingReviewDetails(int reviewId)
        {
            List<EmployeeReviewDetail> employeeReviewInformations = null;

            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iREVIEW_ID", value: reviewId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKPI_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                var results = await connection.QueryAsync<EmployeeReviewDetail>(PerformanceManagement.SP_GET_TEAM_MEMBER_KRA, parameters, commandType: CommandType.StoredProcedure);
                employeeReviewInformations = results.ToList();
                return employeeReviewInformations;
            }
        }
        public async Task<List<EmployeeReviewInformation>> GetEmployeeNonSubmittedDetails(int managerid)
        {
            List<EmployeeReviewInformation> employeeReviewInformations = null;

            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "IMANAGER_ID", value: managerid, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                var results = await connection.QueryAsync<EmployeeReviewInformation>(PerformanceManagement.SP_GET_NON_SUBMITTED_REVIEW, parameters, commandType: CommandType.StoredProcedure);
                employeeReviewInformations = results.ToList();
                return employeeReviewInformations;
            }
        }

        public async Task<List<EmployeeReviewInformation>> GetReviewerPendingReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", value: employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbPenidngReviews = await connection.QueryAsync<EmployeeReviewInformation>(PerformanceManagement.SP_GET_PENDING_REVIEW_INFO, parameters, commandType: CommandType.StoredProcedure);
                pendingReviews = dbPenidngReviews.ToList();
            }
            return pendingReviews;
        }
        public async Task<List<EmployeeReviewInformation>> GetAppraiserPendingReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", value: employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iIS_FOR_APPRAISER", value: 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbPenidngReviews = await connection.QueryAsync<EmployeeReviewInformation>(PerformanceManagement.SP_GET_PENDING_REVIEW_INFO, parameters, commandType: CommandType.StoredProcedure);
                pendingReviews = dbPenidngReviews.ToList();
            }
            return pendingReviews;
        }
        public async Task<List<EmployeeReviewInformation>> GetEmployeeFinalReviewInformations()
        {
            List<EmployeeReviewInformation> employeeReviewInformations = null;

            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                var results = await connection.QueryAsync<EmployeeReviewInformation>(PerformanceManagement.SP_GET_EMPLOYEE_FINAL_REVIEWS, parameters, commandType: CommandType.StoredProcedure);
                employeeReviewInformations = results.ToList();
                return employeeReviewInformations;
            }
        }

        public async Task<List<EmployeeReviewInformation>> GetPendingReviewInformations(int employeeSlno, Enumerations.ReviewerType reviewerType)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                parameters = new OracleDynamicParameters();
                parameters.Add(name: "iEMPLOYEESLNO", value: employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "iIS_FOR_APPRAISER", value: reviewerType.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "oKRA_DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                var dbPenidngReviews = await connection.QueryAsync<EmployeeReviewInformation>(PerformanceManagement.SP_GET_PENDING_REVIEW_INFO, parameters, commandType: CommandType.StoredProcedure);
                pendingReviews = dbPenidngReviews.ToList();
            }
            return pendingReviews;
        }
        public async Task<bool> SaveEmployeePerformanceReview(EmployeeReviewInformation reviewInformation, ReviewerType reviewerType)
        {
            bool isSaved = false;
            OracleDynamicParameters parameters = null;
            int rowsUpdated = 0;
            if (reviewInformation != null && reviewInformation.EmployeeReviewDetails != null)
            {
                List<EmployeeReviewDetail> reviewDetails = reviewInformation.EmployeeReviewDetails;
                List<int> recordIds = reviewDetails.Select(x => x.RecordId.ToInt32OrDefault()).ToList();
                List<double> employeeScores = reviewDetails.Select(x => x.EmployeeScore.ToDoubleOrDefault()).ToList();
                List<string> employeeComments = reviewDetails.Select(x => x.EmployeeComments).ToList();
                List<double> appraiserScores = reviewDetails.Select(x => x.AppraiserScore.ToDoubleOrDefault()).ToList();
                List<string> appraiserComments = reviewDetails.Select(x => x.AppraiserComments).ToList();
                List<double> reviewerScores = reviewDetails.Select(x => x.ReviewerScore.ToDoubleOrDefault()).ToList();
                List<string> reviewerComments = reviewDetails.Select(x => x.ReviewerComments).ToList();

                using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
                {
                    parameters = new OracleDynamicParameters();

                    parameters.Add(name: "iREVIEW_ID", value: reviewInformation.ReviewId.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iREVIEW_TYPE_ID", value: reviewerType.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iEMPLOYEE_TOTAL_SCORE", value: reviewInformation.EmployeeScore, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iEMPLOYEE_FINAL_COMMENTS", value: reviewInformation.EmployeeComments, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iIS_DRAFT", value: reviewInformation.IsDraft.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iIS_SUBMITTED", value: reviewInformation.IsSubmitted.ToInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iAPPRAISER_TOTAL_SCORE", value: reviewInformation.AppraiserScore, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iAPPRAISER_FINAL_COMMENTS", value: reviewInformation.AppraiserComments, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iREVIEWER_TOTAL_SCORE", value: reviewInformation.ReviewerScore, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iREVIEWER_FINAL_COMMENTS", value: reviewInformation.ReviewerComments, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    
                    parameters.Add(name: "iRECORD_ID", recordIds.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, recordIds.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iEMPLOYEE_SCORE", employeeScores.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, employeeScores.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iEMPLOYEE_COMMENTS", employeeComments.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, employeeComments.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iAPPRAISER_SCORE", appraiserScores.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, appraiserScores.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iAPPRAISER_COMMENTS", appraiserComments.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, appraiserComments.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iREVIEWER_SCORE", reviewerScores.ToArray(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input, reviewerScores.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "iREVIEWER_COMMENTS", reviewerComments.ToArray(), dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input, reviewerComments.Count,
                        collectionType: OracleMappingCollectionType.PLSQLAssociativeArray);
                    parameters.Add(name: "AFFECTEDROWCOUNT", dbType: OracleMappingType.Int32, direction: ParameterDirection.Output);

                    rowsUpdated = await connection.ExecuteAsync(PerformanceManagement.SP_SAVE_EMP_PERFORMANCE_REVIEW, parameters, commandType: CommandType.StoredProcedure);
                    rowsUpdated = parameters.Get<int>("AFFECTEDROWCOUNT");
                }
            }
            isSaved = rowsUpdated > 0;
            return isSaved;
        }
    }
}
