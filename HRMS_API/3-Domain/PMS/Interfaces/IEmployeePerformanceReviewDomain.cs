using Phoenix.CrossCutting.Enumerations;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Domain.PMS.Interfaces
{
    public interface IEmployeePerformanceReviewDomain
    {
        Task<List<EmployeeReviewInformation>> GetAppraiserPendingReviewInformations(int employeeSlno);

        Task<List<EmployeeReviewInformation>> GetPendingReviewInformations(int employeeSlno, Enumerations.ReviewerType reviewerType);
        Task<List<EmployeeReviewInformation>> GetEmployeeReviewInformations(int employeeSlno);
        Task<List<EmployeeReviewDetail>> GetEmployeePendingReviewDetails(int reviewId);
        Task<List<EmployeeReviewInformation>> GetEmployeeNonSubmittedDetails(int managerId);
        Task<EmployeeReviewInformation> GetEmployeeReviewInformation(int kraInformationId);
        Task<List<EmployeeReviewInformation>> GetReviewerPendingReviewInformations(int employeeSlno);
        Task<List<EmployeeReviewInformation>> GetEmployeeFinalReviewInformations();
        Task<bool> SaveEmployeePerformanceReview(EmployeeReviewInformation reviewInformation, ReviewerType reviewerType);

    }
}
