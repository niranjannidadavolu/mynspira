using Microsoft.Extensions.Configuration;
using Phoenix.Application.Base;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Enumerations;

namespace Phoenix.Application.PMS.Implementations
{
    public class EmployeePerformanceReviewApplication : BaseApplication, IEmployeePerformanceReviewApplication
    {
        private readonly IConfiguration configuration;
        private readonly IEmployeePerformanceReviewDomain employeePerformanceReviewDomain;
        public EmployeePerformanceReviewApplication(IConfiguration configuration, IEmployeePerformanceReviewDomain employeePerformanceReviewDomain) : base(configuration)
        {
            this.configuration = configuration;
            this.employeePerformanceReviewDomain = employeePerformanceReviewDomain;
        }

        public async Task<EmployeeReviewInformation> GetEmployeeReviewInformation(int kraInformationId)
        {
            EmployeeReviewInformation employeeReviewInformation = null;
            employeeReviewInformation = await this.employeePerformanceReviewDomain.GetEmployeeReviewInformation(kraInformationId);
            return employeeReviewInformation;
        }
        public async Task<List<EmployeeReviewInformation>> GetEmployeeReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            pendingReviews = await this.employeePerformanceReviewDomain.GetEmployeeReviewInformations(employeeSlno);
            return pendingReviews;
        }

        public async Task<List<EmployeeReviewDetail>> GetEmployeePendingReviewDetails(int reviewId)
        {
            List<EmployeeReviewDetail> pendingReviews = null;
            pendingReviews = await this.employeePerformanceReviewDomain.GetEmployeePendingReviewDetails(reviewId);
            return pendingReviews;
        }
        public async Task<List<EmployeeReviewInformation>> GetEmployeeNonSubmittedDetails(int managerId)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            pendingReviews = await this.employeePerformanceReviewDomain.GetEmployeeNonSubmittedDetails(managerId);
            return pendingReviews;
        }

        public async Task<List<EmployeeReviewInformation>> GetAppraiserPendingReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            pendingReviews = await this.employeePerformanceReviewDomain.GetAppraiserPendingReviewInformations(employeeSlno);
            return pendingReviews;
        }

        public async Task<List<EmployeeReviewInformation>> GetPendingReviewInformations(int employeeSlno, Enumerations.ReviewerType reviewerType)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            pendingReviews = await this.employeePerformanceReviewDomain.GetPendingReviewInformations(employeeSlno, reviewerType);
            return pendingReviews;
        }
        public async Task<List<EmployeeReviewInformation>> GetReviewerPendingReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            pendingReviews = await this.employeePerformanceReviewDomain.GetReviewerPendingReviewInformations(employeeSlno);
            return pendingReviews;
        }

        public async Task<List<EmployeeReviewInformation>> GetEmployeeFinalReviewInformations()
        {
            List<EmployeeReviewInformation> pendingReviews = null;
            pendingReviews = await this.employeePerformanceReviewDomain.GetEmployeeFinalReviewInformations();
            return pendingReviews;
        }

        public async Task<bool> SaveEmployeePerformanceReview(EmployeeReviewInformation reviewInformation, Enumerations.ReviewerType reviewerType)
        {
            bool isSaved = false;
            isSaved = await this.employeePerformanceReviewDomain.SaveEmployeePerformanceReview(reviewInformation, reviewerType);
            return isSaved;
        }

    }
}
