using System.Security.AccessControl;
using Phoenix.Model.Business.LeaveManagementReports;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveDetail
    {
         public int LeaveId { get; set; }
        public int EntitlementId { get; set; }
        public double ConsumedLeaves { get; set; }
        public DateTime LeaveFrom { get; set; }
        public DateTime LeaveTo { get; set; }
        public string? Remarks { get; set; }
        public DateTime LeaveAppliedOn { get; set; }
        public decimal TotalDaysTaken { get; set; }
        public string? ApprovedRemarks { get; set; }
        public DateTime ApprovedOn { get; set; }
        public int ApprovedBy { get; set; }

        public string? LeaveStatusName { get; set; }
        public string? LeaveTypeName { get; set; }
        public string? LeaveTypeCode { get; set; }
        public string? LeaveDayTypeName { get; set; }
        public int StatusId { get; set; }
        public string? EmployeeName { get; set; }
        public string? EmployeeId { get; set; }
        public string? EmployeeNumber { get; set; }
        public string PhotoPath { get; set; }
        public int LeaveStatusId { get; set; }
        public int ManagerId { get; set; }
        public int LeaveTypeId { get; set; }
        public string LeaveStatusStyle { get; set; }
        public int FromDateDayTypeId { get; set; }
        public int ToDateDayTypeId { get; set; }
        public string? FromDateDayTypeName { get; set; }
        public string? ToDateDayTypeName { get; set; }
        public int EmployeeSlno { get; set; }
        public int  LeaveWorkFlowStepId { get; set; }
        public int  WorkFlowTypeId  { get; set; }
        public int StepTypeId   { get; set; }
        public int StepMasterId { get; set; }
        public List<LeaveWorkFlow>? LeaveWorkFlows { get; set; }
        public bool EnableDelete { get; set; }
        public DateTime? CompOffDate { get; set; }
        public double? EarlyLogoutTime { get; set; }
        public string OfficeTypeName { get; set; }
        public string EarlyLogoutTimeDisplay
        {
            get
            {
                string time = string.Empty;
                if (EarlyLogoutTime.HasValue)
                {
                    TimeSpan ts = TimeSpan.FromMinutes(EarlyLogoutTime.Value);
                    time = string.Format("{0}:{1}", ts.Hours.ToString("00"), ts.Minutes.ToString("00"));
                }
                return time;
            }
        }
        public string BranchName { get; set; }

        public string? LeaveReason { get; set; }
        
        public List<LeaveWorkFlowReport>? LeaveWorkFlowReport { get; set; }
        
        public List<LeaveFileUploadReports>? LeaveFileUploadReports { get; set; }

        public int? HREmployeeSlno { get; set; }

        public LeaveDetail()
        {
            ApprovedBy = 0;
            ApprovedOn = DateTime.Now;
        }

    }

    public class TeamLeaveUpdateDetail
    {
        public List<int> LeaveId { get; set; }
        public string ApprovedBy { get; set; }
        public string ApprovedRemarks { get; set; }
        public int LeaveStatusId { get; set; }
    }
}
