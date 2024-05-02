
namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmpLeaves
    {      
        public int LeaveId { get; set; }
        public int? EntitlementId { get; set; }
        public int? EmployeeSlno { get; set; }
        public DateTime? LeaveFrom { get; set; }
        public DateTime? LeaveTo { get; set; }
        public string? Remarks { get; set; }
        public DateTime? LeaveAppliedOn { get; set; }
        public int? TotalDaysTaken { get; set; }
        public string? ApprovedRemarks { get; set; }
        public DateTime? ApprovedOn { get; set; }
        public string? LeaveStatusName { get; set; }
        public string? LeaveTypeName { get; set; }
        public string? LeaveTypeCode { get; set; }
        public string? LeaveDayTypeName { get; set; }
        public int ConsumedLeaves { get; set; }        
    }
}