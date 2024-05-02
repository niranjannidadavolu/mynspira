using Phoenix.Application.LeaveManagement.Interfaces;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.LeaveManagementReports;
using Phoenix.Model.Business.SearchCriteria.LeaveManagement;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.LeaveManagement.Implementations
{
    public class LeaveManagementApplication: ILeaveManagementApplication
    {
        private readonly ILeaveManagementDomain leaveManagementDomain;
        public LeaveManagementApplication(ILeaveManagementDomain leaveManagementDomain)
        {
            this.leaveManagementDomain = leaveManagementDomain;
        }

        public async Task<List<LeaveDetail>> GetEmployeeLeaves(int empSLNo,int statusId)
        {
            List<LeaveDetail> employeeLeaveStatus = await leaveManagementDomain.GetEmployeeLeaves(empSLNo, statusId);
            return employeeLeaveStatus;
        }
        public async Task<EmpLeavePolicyDetails> GetEmpLeavesbyLeaveId(int leaveId)
        {
            EmpLeavePolicyDetails empLeavePolicyDetails = await leaveManagementDomain.GetEmpLeavesbyLeaveId(leaveId);
            return empLeavePolicyDetails;
        }
        public async Task<List<EmpLeaveBalance>> GetEmployeeLeaveBalance(int empSLNo)
        {
            List<EmpLeaveBalance> employeeLeaves = await leaveManagementDomain.GetEmployeeLeaveBalance(empSLNo);
            return employeeLeaves;
        }
        public async Task<bool> UpdateEmployeeLeaveStatus(LeaveDetail empLeave)
        {
           bool updateEmployeeLeaveStatus = await leaveManagementDomain.UpdateEmployeeLeaveStatus(empLeave);
            return updateEmployeeLeaveStatus;
        }
        public async Task<bool> UpdateTeamLeaves(List<LeaveDetail> teamLeaves)
        {
            bool updateEmployeeLeaveStatus = await leaveManagementDomain.UpdateTeamLeaves(teamLeaves);
            return updateEmployeeLeaveStatus;
        }
        public async Task<EmpLeaveResponse> SaveEmployeeLeave(EmployeeLeave empLeaveRequest)
        {
            EmpLeaveResponse SaveEmployeeLeave = await leaveManagementDomain.SaveEmployeeLeave(empLeaveRequest);
            return SaveEmployeeLeave;
        }
        public async Task<List<LeaveDetail>> GetLeavesWaitingForApproval(LeaveSearchCriteria searchCriteria)
        {
            List<LeaveDetail> empList = await leaveManagementDomain.GetLeavesWaitingForApproval(searchCriteria);
            return empList;
        }

        public async Task<List<EmployeeLeaveReport>> GetTeamLeaves(LeaveSearchCriteria searchCriteria)
        {
            List<EmployeeLeaveReport> empList = await leaveManagementDomain.GetTeamLeaves(searchCriteria);
            return empList;
        }
        public async Task<List<GetTeamEmpLeavesData>> GetMyTeamEmployeeLeaves(LeaveSearchCriteria searchCriteria)
        {
            List<GetTeamEmpLeavesData> leaveList = await leaveManagementDomain.GetMyTeamEmployeeLeaves(searchCriteria);
            return leaveList;
        }
        public async Task<List<LeaveDetail>> GetManagerApprovalLeaves(int employeeSlno)
        {
            List<LeaveDetail> empList = await leaveManagementDomain.GetManagerApprovalLeaves(employeeSlno);
            return empList;
        }

        public async Task<int> GetUtilizedOnDuties(int employeeSlno)
        {
            int utilizedOnDuties = await leaveManagementDomain.GetUtilizedOnDuties(employeeSlno);
            return utilizedOnDuties;
        }

        public async Task<List<EmpLeaveFileDetails>> GetEmpLeaveFiles(int leaveId)
        {
            List <EmpLeaveFileDetails>leaveFileDetails = await leaveManagementDomain.GetEmpLeaveFiles(leaveId);
            return leaveFileDetails;
        }

        public async Task<bool> CancelLeave(int leaveId, int updatedBy)
        {
            bool updateEmployeeLeaveStatus = await leaveManagementDomain.CancelLeave(leaveId, updatedBy);
            return updateEmployeeLeaveStatus;
        }
        public async Task<List<LeaveBalance>> GetLeaveBalancesReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<LeaveBalance> leaveDetails = await leaveManagementDomain.GetLeaveBalancesReport(searchCriteria);
            return leaveDetails;
        }

        public async Task<List<EmployeeLeaveReport>> GetEmployeeLeaveReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<EmployeeLeaveReport> leaveDetails = await leaveManagementDomain.GetEmployeeLeaveReport(searchCriteria);
            return leaveDetails;
        }
        public async Task<List<LeaveEntitlementReport>> GetLeaveEntitlementReport(LeaveReportSearchCriteria searchCriteria)
        {
            List<LeaveEntitlementReport> leaveEntitlementDetails = await leaveManagementDomain.GetLeaveEntitlementReport(searchCriteria);
            return leaveEntitlementDetails;
        }

        public async Task<bool> UpdateTeamLeavesByHR(List<LeaveDetail> teamLeaveDetails)
        {
            bool updateEmployeeLeaveStatus = await leaveManagementDomain.UpdateTeamLeavesByHR(teamLeaveDetails);
            return updateEmployeeLeaveStatus;
        }
    }
}