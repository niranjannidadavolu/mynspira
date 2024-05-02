using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.LeaveManagement;
using Phoenix.Database.Repository.LeaveManagementReports;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.LeaveManagementReports;
using Phoenix.Model.Business.SearchCriteria.LeaveManagement;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Domain.LeaveManagement.Implementations
{
    public class LeaveManagementDomain : ILeaveManagementDomain
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;

        public LeaveManagementDomain(IConfiguration configuration, ILoggerManager logger)
        {
            this.configuration = configuration;
            this.logger = logger;
        }


        public async Task<List<LeaveDetail>> GetEmployeeLeaves(int empSLNo, int statusId)
        {
            List<LeaveDetail> empLeaveStatusList = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeaveStatusList = await leaveManagementRepository.GetEmployeeLeaves(empSLNo, statusId);
            }
            return empLeaveStatusList;
        }

        public async Task<EmpLeavePolicyDetails> GetEmpLeavesbyLeaveId(int leaveId)
        {
            EmpLeavePolicyDetails empLeavePolicyDetails = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeavePolicyDetails = await leaveManagementRepository.GetEmpLeavesbyLeaveId(leaveId);
            }
            return empLeavePolicyDetails;
        }

        public async Task<List<EmpLeaveBalance>> GetEmployeeLeaveBalance(int empSLNo)
        {
            List<EmpLeaveBalance> empLeaveList = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeaveList = await leaveManagementRepository.GetEmployeeLeaveBalance(empSLNo);
            }
            return empLeaveList;
        }

        public async Task<bool> UpdateEmployeeLeaveStatus(LeaveDetail empLeave)
        {
            bool empLeaveStatus = false;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeaveStatus = await leaveManagementRepository.UpdateEmployeeLeaveStatus(empLeave);
            }
            return empLeaveStatus;
        }
        public async Task<bool> UpdateTeamLeaves(List<LeaveDetail> teamLeaves)
        {
            bool empLeaveStatus = false;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeaveStatus = await leaveManagementRepository.UpdateTeamLeaves(teamLeaves);
            }
            return empLeaveStatus;
        }

        public async Task<bool> UpdateTeamLeavesByHR(List<LeaveDetail> teamLeaves)
        {
            bool empLeaveStatus = false;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeaveStatus = await leaveManagementRepository.UpdateTeamLeavesByHR(teamLeaves);
            }
            return empLeaveStatus;
        }
        public async Task<EmpLeaveResponse> SaveEmployeeLeave(EmployeeLeave empLeaveRequest)
        {
            EmpLeaveResponse empLeave = new EmpLeaveResponse();
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeave = await leaveManagementRepository.SaveEmployeeLeave(empLeaveRequest);
            }
            return empLeave;
        }

        public async Task<List<LeaveDetail>> GetLeavesWaitingForApproval(LeaveSearchCriteria searchCriteria)
        {
            List<LeaveDetail> employeeList = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                employeeList = await leaveManagementRepository.GetLeavesWaitingForApproval(searchCriteria);
            }
            return employeeList;
        }

        public async Task<List<EmployeeLeaveReport>> GetTeamLeaves(LeaveSearchCriteria searchCriteria)
        {
            List<EmployeeLeaveReport> employeeList = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                employeeList = await leaveManagementRepository.GetMyTeamLeaves(searchCriteria);
            }
            return employeeList;
        }
        public async Task<List<GetTeamEmpLeavesData>> GetMyTeamEmployeeLeaves(LeaveSearchCriteria searchCriteria)
        {
            List<GetTeamEmpLeavesData> leaveList = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveList = await leaveManagementRepository.GetMyTeamEmployeeLeaves(searchCriteria);
            }
            return leaveList;
        }
        public async Task<List<LeaveDetail>> GetManagerApprovalLeaves(int employeeSlno)
        {
            List<LeaveDetail> employeeList = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                employeeList = await leaveManagementRepository.GetManagerApprovalLeaves(employeeSlno);
            }
            return employeeList;
        }

        public async Task<int> GetUtilizedOnDuties(int employeeSlno)
        {
            int utilizedOnDuties;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                utilizedOnDuties = await leaveManagementRepository.GetUtilizedOnDuties(employeeSlno);
            }
            return utilizedOnDuties;
        }

        public async Task<List<EmpLeaveFileDetails>> GetEmpLeaveFiles(int leaveId)
        {
            List <EmpLeaveFileDetails>empLeaveFileDetails = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                empLeaveFileDetails = await leaveManagementRepository.GetEmpLeaveFiles(leaveId);
            }
            return empLeaveFileDetails;
        }

        public async Task<bool> CancelLeave(int leaveId, int updatedBy)
        {
            bool isLeaveCancelled;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                isLeaveCancelled = await leaveManagementRepository.CancelLeave(leaveId,updatedBy);
            }
            return isLeaveCancelled;
        }

        public Task<bool> UpdateMultipleEmployeeLeaveStatus(UpdateMultipleEmployeeLeaveStatusReq empLeaveDetails)
        {
            throw new System.NotImplementedException();
        }

        public Task<List<LeaveDetail>> GetLeavesWaitingForApproval(int employeeSlno)
        {
            throw new System.NotImplementedException();
        }

        public async Task<List<LeaveBalance>> GetLeaveBalancesReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<LeaveBalance> leaveDetails = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveDetails = await leaveManagementRepository.GetLeaveBalancesReport(searchCriteria);
            }
            return leaveDetails;
        }

        public async Task<List<EmployeeLeaveReport>> GetEmployeeLeaveReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<EmployeeLeaveReport> leaveDetails = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveDetails = await leaveManagementRepository.GetEmployeeLeaveReport(searchCriteria);
            }
            return leaveDetails;
        }
        public async Task<List<LeaveEntitlementReport>> GetLeaveEntitlementReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<LeaveEntitlementReport> leaveEntitlementDetails = null;
            using (LeaveManagementRepository leaveManagementRepository = new(configuration, logger))
            {
                leaveEntitlementDetails = await leaveManagementRepository.GetLeaveEntitlementReport(searchCriteria);
            }
            return leaveEntitlementDetails;
        }
    }
}
