using Phoenix.Application.LeaveManagementReports.Interfaces;
using Phoenix.Domain.LeaveManagementReports.Interfaces;
using Phoenix.Model.Business.LeaveManagementReports;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Model.Business.LeaveManagement;

namespace Phoenix.Application.LeaveManagementReports.Implementations
{
    public class ReportsApplication : IReportsApplication
    {
        private readonly IReportsDomain leaveManagementDomain;
        public ReportsApplication(IReportsDomain leaveManagementDomain)
        {
            this.leaveManagementDomain = leaveManagementDomain;
        }
        public async Task<List<LeaveDetailReport>> GetLeaveReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveDetails = await leaveManagementDomain.GetLeaveReport(getLeaveReportReq);
            return leaveDetails;
        }

        public async Task<List<LeaveDetail>> GetLeavesForHRApproval(LeaveReportSearchCriteria leaveReportSearchCriteria)
        {
            List<LeaveDetail> leaveDetails = await leaveManagementDomain.GetLeavesForHRApproval(leaveReportSearchCriteria);
            return leaveDetails;
        }

        public async Task<List<AutoApprovalReport>> GetAutoApprovalReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<AutoApprovalReport> employeeLeaveStatus = await leaveManagementDomain.GetAutoApprovalReport(getLeaveReportReq);
            return employeeLeaveStatus;
        }
        public async Task<List<LeaveDetailReport>> GetLeaveTransactions(GetLeaveTransactionReq getLeaveTransactionReq)
        {
            List<LeaveDetailReport> leaveDetails = await leaveManagementDomain.GetLeaveTransactions(getLeaveTransactionReq);
            return leaveDetails;
        }
        public async Task<List<EmployeeVerificationDetailReport>> GetEmployeeVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeVerificationDetailReport> details = await leaveManagementDomain.GetEmployeeVerificationReport(reportReq);
            return details;
        }
        public async Task<List<EmployeePanVerificationDetailReport>> GetEmployeePanVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeePanVerificationDetailReport> details = await leaveManagementDomain.GetEmployeePanVerificationReport(reportReq);
            return details;
        }
        public async Task<List<EmployeeItrDetailReport>> GetEmployeeITRReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeItrDetailReport> details = await leaveManagementDomain.GetEmployeeITRReport(reportReq);
            return details;
        }
        public async Task<List<LeaveDetailReport>> GetAllLeaves(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveDetails = await leaveManagementDomain.GetAllLeaves(getLeaveReportReq);
            return leaveDetails;
        }

        public async Task<List<LeaveDetailReport>> GetLeaveBalancesReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveDetails = await leaveManagementDomain.GetLeaveBalancesReport(getLeaveReportReq);
            return leaveDetails;
        }
    }
}
