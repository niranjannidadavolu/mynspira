using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.TimePeriod;
using Phoenix.Database.Repository.LeaveManagementReports;
using Phoenix.Database.Repository.Reports;
using Phoenix.Domain.LeaveManagementReports.Interfaces;
using Phoenix.Model.Business.LeaveManagementReports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;
using Phoenix.Model.Business.LeaveManagement;

namespace Phoenix.Domain.LeaveManagementReports.Implementations
{
    public class ReportsDomain : IReportsDomain
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;

        public ReportsDomain(IConfiguration configuration, ILoggerManager logger)
        {
            this.configuration = configuration;
            this.logger = logger;
        }


        public async Task<List<LeaveDetailReport>> GetLeaveReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveDetails = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveDetails = await leaveManagementRepository.GetLeaveReport(getLeaveReportReq);
            }
            return leaveDetails;
        }

        public async Task<List<LeaveDetail>> GetLeavesForHRApproval(LeaveReportSearchCriteria leaveReportSearchCriteria)
        {
            List<LeaveDetail> leaveDetails = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveDetails = await leaveManagementRepository.GetLeavesForHRApproval(leaveReportSearchCriteria);
            }
            return leaveDetails;
        }

        public async Task<List<AutoApprovalReport>> GetAutoApprovalReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<AutoApprovalReport> empLeaveStatusList = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeaveStatusList = await leaveManagementRepository.GetAutoApprovalReport(getLeaveReportReq);
            }
            return empLeaveStatusList;
        }
        public async Task<List<LeaveDetailReport>> GetLeaveTransactions(GetLeaveTransactionReq getLeaveTransactionReq)
        {
            List<LeaveDetailReport> leaveDetails = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveDetails = await leaveManagementRepository.GetLeaveTransactions(getLeaveTransactionReq);
            }
            return leaveDetails;
        }
        public async Task<List<EmployeeVerificationDetailReport>> GetEmployeeVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeVerificationDetailReport> details = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                details = await leaveManagementRepository.GetEmployeeVerificationReport(reportReq);
            }
            return details;
        }
        public async Task<List<EmployeePanVerificationDetailReport>> GetEmployeePanVerificationReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeePanVerificationDetailReport> details = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                details = await leaveManagementRepository.GetEmployeePanVerificationReport(reportReq);
            }
            return details;
        }
        public async Task<List<EmployeeItrDetailReport>> GetEmployeeITRReport(EmployeeVerificationReportReq reportReq)
        {
            List<EmployeeItrDetailReport> details = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                details = await leaveManagementRepository.GetEmployeeITRReport(reportReq);
            }
            return details;
        }

        public async Task<List<LeaveDetailReport>> GetAllLeaves(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveDetails = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveDetails = await leaveManagementRepository.GetAllLeaves(getLeaveReportReq);
            }
            return leaveDetails;
        }

        public async Task<List<LeaveDetailReport>> GetLeaveBalancesReport(LeaveReportSearchCriteria getLeaveReportReq)
        {
            List<LeaveDetailReport> leaveDetails = null;
            using (ReportsRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveDetails = await leaveManagementRepository.GetLeaveBalancesReport(getLeaveReportReq);
            }
            return leaveDetails;
        }
    }
}
