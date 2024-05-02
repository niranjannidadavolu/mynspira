using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.LeaveManagement.Implementations;
using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Application.LeaveManagementReports.Interfaces;
using Phoenix.Model.Business.LeaveManagementReports;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Model.Business.LeaveManagement;

namespace Phoenix.Web.Service.Controllers.LeaveManagementReports
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportsController : ControllerBase
    {
        private readonly IReportsApplication leaveManagementApplication;

        public ReportsController(IReportsApplication leaveManagementApplication)
        {
            this.leaveManagementApplication = leaveManagementApplication;
        }


        [Authorize]
        [HttpPost]
        [Route("GetLeaveReport")]
        public async Task<List<LeaveDetailReport>> GetLeaveReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveStatusList = await leaveManagementApplication.GetLeaveReport(getLeaveReportReq);
            return leaveStatusList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetLeavesForHRApproval")]
        public async Task<List<LeaveDetail>> GetLeavesForHRApproval(LeaveReportSearchCriteria leaveReportSearchCriteria)
        {
            List<LeaveDetail> employeeLeaves = await leaveManagementApplication.GetLeavesForHRApproval(leaveReportSearchCriteria);
            return employeeLeaves;
        }

        [Authorize]
        [HttpPost]
        [Route("GetAllLeaves")]
        public async Task<List<LeaveDetailReport>> GetAllLeaves(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveStatusList = await leaveManagementApplication.GetAllLeaves(getLeaveReportReq);
            return leaveStatusList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetAutoApprovalReport")]
        public async Task<List<AutoApprovalReport>> GetAutoApprovalReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<AutoApprovalReport> leaveStatusList = await leaveManagementApplication.GetAutoApprovalReport(getLeaveReportReq);
            return leaveStatusList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetLeaveTransactions")]
        public async Task<List<LeaveDetailReport>> GetLeaveTransactions(GetLeaveTransactionReq getLeaveTransactionReq)
        {
            List<LeaveDetailReport> leavesList = await leaveManagementApplication.GetLeaveTransactions(getLeaveTransactionReq);
            return leavesList;
        }


        [Authorize]
        [HttpPost]
        [Route("GetEmployeeVerificationReport")]
        public async Task<List<EmployeeVerificationDetailReport>> GetEmployeeVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeVerificationDetailReport> resultList = await leaveManagementApplication.GetEmployeeVerificationReport(reportReq);
            return resultList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetEmployeePanVerificationReport")]
        public async Task<List<EmployeePanVerificationDetailReport>> GetEmployeePanVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeePanVerificationDetailReport> resultList = await leaveManagementApplication.GetEmployeePanVerificationReport(reportReq);
            return resultList;
        }

        [Authorize]
        [HttpPost]
        [Route("GetEmployeeITRReport")]
        public async Task<List<EmployeeItrDetailReport>> GetEmployeeITRReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeItrDetailReport> resultList = await leaveManagementApplication.GetEmployeeITRReport(reportReq);
            return resultList;
        }

        
    }
}
