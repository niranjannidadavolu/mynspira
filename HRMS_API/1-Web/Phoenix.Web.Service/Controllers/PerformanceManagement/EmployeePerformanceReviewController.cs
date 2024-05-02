using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Implementations;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.CrossCutting.Enumerations;
using Phoenix.Model.Business.PMS;
using Phoenix.Web.Service.Base;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.PerformanceManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeePerformanceReviewController : BaseController
    {
        private readonly IEmployeePerformanceReviewApplication employeeevaluationApplication;
        public EmployeePerformanceReviewController(IEmployeePerformanceReviewApplication employeeevaluationApplication)
        {
            this.employeeevaluationApplication = employeeevaluationApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeReviewInformation")]
        public async Task<EmployeeReviewInformation> GetEmployeeReviewInformation(int kraInformationId)
        {
            EmployeeReviewInformation employeeReviewInformation = await employeeevaluationApplication.GetEmployeeReviewInformation(kraInformationId);
            return employeeReviewInformation;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeReviewInformations")]
        public async Task<List<EmployeeReviewInformation>> GetEmployeeReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviewInformations = await employeeevaluationApplication.GetEmployeeReviewInformations(employeeSlno);
            return pendingReviewInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeePendingReviewDetails")]
        public async Task<List<EmployeeReviewDetail>> GetEmployeePendingReviewDetails(int reviewId)
        {
            List<EmployeeReviewDetail> pendingReviewInformations = await employeeevaluationApplication.GetEmployeePendingReviewDetails(reviewId);
            return pendingReviewInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeNonSubmittedDetails")]
        public async Task<List<EmployeeReviewInformation>> GetEmployeeNonSubmittedDetails(int managerId)
        {
            List<EmployeeReviewInformation> pendingReviewInformations = await employeeevaluationApplication.GetEmployeeNonSubmittedDetails(managerId);
            return pendingReviewInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAppraiserPendingReviewInformations")]
        public async Task<List<EmployeeReviewInformation>> GetAppraiserPendingReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviewInformations = await employeeevaluationApplication.GetAppraiserPendingReviewInformations(employeeSlno);
            return pendingReviewInformations;
        }


        [Authorize]
        [HttpGet]
        [Route("GetPendingReviewInformations")]
        public async Task<List<EmployeeReviewInformation>> GetPendingReviewInformations(int employeeSlno, Enumerations.ReviewerType reviewerType)
        {
            List<EmployeeReviewInformation> pendingReviewInformations = await employeeevaluationApplication.GetPendingReviewInformations(employeeSlno, reviewerType);
            return pendingReviewInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetReviewerPendingReviewInformations")]
        public async Task<List<EmployeeReviewInformation>> GetReviewerPendingReviewInformations(int employeeSlno)
        {
            List<EmployeeReviewInformation> pendingReviewInformations = await employeeevaluationApplication.GetReviewerPendingReviewInformations(employeeSlno);
            return pendingReviewInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeFinalReviewInformations")]
        public async Task<List<EmployeeReviewInformation>> GetEmployeeFinalReviewInformations()
        {
            List<EmployeeReviewInformation> pendingReviewInformations = await employeeevaluationApplication.GetEmployeeFinalReviewInformations();
            return pendingReviewInformations;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveEmployeePerformanceReview")]
        public async Task<bool> SaveEmployeePerformanceReview([FromBody] EmployeeReviewInformation reviewInformation, Enumerations.ReviewerType reviewerType)
        {
            bool isSaved = await employeeevaluationApplication.SaveEmployeePerformanceReview(reviewInformation, reviewerType);
            return isSaved;
        }

    }
}
