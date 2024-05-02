using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.LeaveManagementReports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.LeaveManagementReports.Interfaces
{
    public interface IReportsDomain
    {
        Task<List<LeaveDetailReport>> GetLeaveReport(LeaveReportSearchCriteria getLeaveReportReq);
        Task<List<LeaveDetail>> GetLeavesForHRApproval(LeaveReportSearchCriteria leaveReportSearchCriteria);
        Task<List<AutoApprovalReport>> GetAutoApprovalReport(LeaveReportSearchCriteria getLeaveReportReq);
        Task<List<LeaveDetailReport>> GetLeaveTransactions(GetLeaveTransactionReq getLeaveTransactionReq);
        Task<List<EmployeeVerificationDetailReport>> GetEmployeeVerificationReport(EmployeeVerificationReportReq reportReq);
        Task<List<EmployeePanVerificationDetailReport>> GetEmployeePanVerificationReport(EmployeeVerificationReportReq reportReq);
        Task<List<EmployeeItrDetailReport>> GetEmployeeITRReport(EmployeeVerificationReportReq reportReq);
        Task<List<LeaveDetailReport>> GetAllLeaves(LeaveReportSearchCriteria getLeaveReportReq);
        Task<List<LeaveDetailReport>> GetLeaveBalancesReport(LeaveReportSearchCriteria getLeaveReportReq);
    }
}
