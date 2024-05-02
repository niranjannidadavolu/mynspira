
namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmpLeaveBalance
    {
        public int EntitlementId { get; set; }
        public int EmployeeSlno { get; set; }
        public int TotalLeaves { get; set; }
        public double ConsumedLeaves { get; set; }
        public double? AvailableLeaveBalance { get; set; }
        public int LeaveTypeId { get; set; }
        public string? LeaveTypeName { get; set; }
        public string? LeaveTypeCode { get; set; }
        public int LeaveInformationId { get; set; }
        public int ShowInDashboard { get; set; }
        
        
    }
}
