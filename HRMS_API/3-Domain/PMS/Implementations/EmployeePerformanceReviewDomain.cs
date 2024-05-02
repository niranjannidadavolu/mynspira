using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Employee;
using Phoenix.Database.Repository.PMS;
using Phoenix.Domain.Base;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Enumerations;

namespace Phoenix.Domain.PMS.Implementations
{
    public class EmployeePerformanceReviewDomain : BaseDomain, IEmployeePerformanceReviewDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public EmployeePerformanceReviewDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<EmployeeReviewInformation> GetEmployeeReviewInformation(int kraInformationId)
        {
            EmployeeReviewInformation employeeReviewInformation = null;
            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                employeeReviewInformation = await repository.GetEmployeeReviewInformation(kraInformationId);
            }
            return employeeReviewInformation;
        }

        public async Task<List<EmployeeReviewInformation>> GetEmployeeReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> employeeReviewInformations = null;
            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                employeeReviewInformations = await repository.GetEmployeeReviewInformations(employeeSlno);
            }
            return employeeReviewInformations;
        }
        
        public async Task<List<EmployeeReviewDetail>> GetEmployeePendingReviewDetails(int reviewId)
        {
            List<EmployeeReviewDetail> employeeReviewInformations = null;
            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                employeeReviewInformations = await repository.GetEmployeePendingReviewDetails(reviewId);
            }
            return employeeReviewInformations;
        }

        public async Task<List<EmployeeReviewInformation>> GetEmployeeNonSubmittedDetails(int managerid)
        {
            List<EmployeeReviewInformation> employeeReviewInformations = null;
            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                employeeReviewInformations = await repository.GetEmployeeNonSubmittedDetails(managerid);
            }
            return employeeReviewInformations;
        }

        public async Task<List<EmployeeReviewInformation>> GetReviewerPendingReviewInformations(int employeeSlno)
        {
            List < EmployeeReviewInformation > pendingReviews = null;

            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                pendingReviews = await repository.GetReviewerPendingReviewInformations(employeeSlno);
            }
            return pendingReviews;
        }
        public async Task<List<EmployeeReviewInformation>> GetAppraiserPendingReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviews = null;

            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                pendingReviews = await repository.GetAppraiserPendingReviewInformations(employeeSlno);
            }
            return pendingReviews;
        }

        public async Task<List<EmployeeReviewInformation>> GetEmployeeFinalReviewInformations()
        {
            List<EmployeeReviewInformation> employeeReviewInformations = null;
            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                employeeReviewInformations = await repository.GetEmployeeFinalReviewInformations();
            }
            return employeeReviewInformations;
        }

        public async Task<List<EmployeeReviewInformation>> GetPendingReviewInformations(int employeeSlno, Enumerations.ReviewerType reviewerType)
        {
            List<EmployeeReviewInformation> pendingReviews = null;

            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                pendingReviews = await repository.GetPendingReviewInformations(employeeSlno, reviewerType);
            }
            return pendingReviews;
        }
        public async Task<bool> SaveEmployeePerformanceReview(EmployeeReviewInformation reviewInformation, Enumerations.ReviewerType reviewerType)
        {
            bool isSaved = false;
            using (EmployeePerformanceReviewRepositry repository = new EmployeePerformanceReviewRepositry(this.configuration, this.redisCache))
            {
                isSaved = await repository.SaveEmployeePerformanceReview(reviewInformation, reviewerType);
            }
            return isSaved;
        }
    }
}
