using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class LeaveDetailReport
    {
        public int LeaveId { get; set; }
        public int EntitlementId { get; set; }
        public double ConsumedLeaves { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeNumber { get; set; }
        public string? EmployeeName { get; set; }
        public long MobileNumber { get; set; }
        public string? WorkEmail { get; set; }
        public string EmpId { get; set; }
        public string BranchName { get; set; }
        public int LeaveStatusId { get; set; }
        public DateTime DOJ { get; set; }
        public DateTime LeaveFrom { get; set; }
        public DateTime LeaveTo { get; set; }
        public string? Remarks { get; set; }
        public DateTime LeaveAppliedOn { get; set; }
        public decimal TotalDaysTaken { get; set; }
        public string? ApprovedRemarks { get; set; }
        public DateTime ApprovedOn { get; set; }
        public string? LeaveStatusName { get; set; }
        public int LeaveTypeId { get; set; }
        public string? LeaveTypeName { get; set; }
        public string? LeaveTypeCode { get; set; }
        public int LeaveDayTypeId { get; set; }

        public string? LeaveDayTypeName { get; set; }
        public string StatusId { get; set; }
        public int FromDateDayTypeId { get; set; }
        public int ToDateDayTypeId { get; set; }
        public string FromDay { get; set; }
        public string ToDay { get; set; }
        public DateTime? CompOffDate { get; set; }
        public double? EarlyLogoutTime { get; set; }
        public string? LeaveReason { get; set; }
        public int ApprovedBy { get; set; }


        public List<LeaveFileUploadReports> leaveFileUploadReports { get; set; }

        public List<LeaveWorkFlowReport> leaveWorkFlowReport { get; set; }
    }
}
