using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.LeaveManagementReports;
using Phoenix.Model.Business.SearchCriteria.LeaveManagement;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.LeaveManagement.Interfaces
{
    public interface ILeaveManagementDomain
    {
        Task<List<LeaveDetail>> GetEmployeeLeaves(int empSLNo, int statusId);
        Task<EmpLeavePolicyDetails> GetEmpLeavesbyLeaveId(int leaveId);
        Task<List<EmpLeaveBalance>> GetEmployeeLeaveBalance(int empSLNo);
        Task<bool> UpdateEmployeeLeaveStatus(LeaveDetail empLeave);
        Task<bool> UpdateMultipleEmployeeLeaveStatus(UpdateMultipleEmployeeLeaveStatusReq empLeaveDetails);
        Task<EmpLeaveResponse> SaveEmployeeLeave(EmployeeLeave empLeaveRequest);
        Task<List<LeaveDetail>> GetLeavesWaitingForApproval(LeaveSearchCriteria searchCriteria);
        Task<List<EmployeeLeaveReport>> GetTeamLeaves(LeaveSearchCriteria searchCriteria);
        Task<List<GetTeamEmpLeavesData>> GetMyTeamEmployeeLeaves(LeaveSearchCriteria searchCriteria);
        Task<List<LeaveDetail>> GetManagerApprovalLeaves(int employeeSlno);
        Task<int> GetUtilizedOnDuties(int employeeSlno);
        Task<List<EmpLeaveFileDetails>> GetEmpLeaveFiles(int leaveId);
        Task<bool> CancelLeave(int leaveId, int updatedBy);
        Task<List<LeaveBalance>> GetLeaveBalancesReport(LeaveReportSearchCriteria searchCriteria);
        Task<List<EmployeeLeaveReport>> GetEmployeeLeaveReport(LeaveReportSearchCriteria searchCriteria);
        Task<List<LeaveEntitlementReport>> GetLeaveEntitlementReport(LeaveReportSearchCriteria searchCriteria);
        Task<bool> UpdateTeamLeaves(List<LeaveDetail> teamLeaveDetails);
        Task<bool> UpdateTeamLeavesByHR(List<LeaveDetail> teamLeaveDetails);
    }
}
