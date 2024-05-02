using Phoenix.CrossCutting.Enumerations;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Application.PMS.Interfaces
{
    public interface IEmployeePerformanceReviewApplication  {
        Task<EmployeeReviewInformation> GetEmployeeReviewInformation(int employeeSlno);
        Task<List<EmployeeReviewInformation>> GetEmployeeReviewInformations(int employeeSlno);
        Task<List<EmployeeReviewDetail>> GetEmployeePendingReviewDetails(int reviewId);
        Task<List<EmployeeReviewInformation>> GetEmployeeNonSubmittedDetails(int managerId);
        Task<List<EmployeeReviewInformation>> GetAppraiserPendingReviewInformations(int employeeSlno);
        Task<List<EmployeeReviewInformation>> GetPendingReviewInformations(int employeeSlno, Enumerations.ReviewerType reviewerType);
        Task<List<EmployeeReviewInformation>> GetReviewerPendingReviewInformations(int employeeSlno);
        Task<List<EmployeeReviewInformation>> GetEmployeeFinalReviewInformations();
        Task<bool> SaveEmployeePerformanceReview(EmployeeReviewInformation reviewInformation, Enumerations.ReviewerType reviewerType);

    }
}
