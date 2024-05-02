namespace Phoenix.Model.Business.LeaveManagement
{

    public class GetTeamLeavesData
    {

        public int EmployeeSlno { get; set; }

        public string EmployeeName { get; set; }
        public string EmpId { get; set; }
        public string WorkEmail { get; set; }
        public string Mobile { get; set; }
        public double TotalLeaveCount { get; set; }
        public string BranchName { get; set; }

    }
    public class GetTeamEmpLeavesData
    {
        public int EmployeeSlno { get; set; }
        public int LeaveId { get; set; }
        public DateTime? LeaveFrom { get; set; }
        public DateTime? LeaveTo { get; set; }
        public string EmployeeName { get; set; }
        public string EmpId { get; set; }
        public string WorkEmail { get; set; }
        public string Mobile { get; set; }
        public double TotalDaysTaken { get; set; }
        public string BranchName { get; set; }
        public int LeaveTypeId { get; set; }
        public string LeaveTypeName { get; set; }
        public string? LeaveTypeCode { get; set; }

        public DateTime? LeaveAppliedOn { get; set; }
        public int LeaveStatusId { get; set; }
        public string LeaveStatusName { get; set; }
        public string LeaveStatusStyle { get; set; }

        public string? ApprovedRemarks { get; set; }
        public DateTime ApprovedOn { get; set; }
        public string? LeaveReason { get; set; }

    }
}
