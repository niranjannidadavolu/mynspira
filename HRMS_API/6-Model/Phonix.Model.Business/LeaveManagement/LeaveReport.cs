namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveReport
    {
        public int EmployeeSlno { get; set; }
        public decimal TotalLeaves { get; set; }
        public decimal ConsumedLeaves { get; set; }
        public decimal EncashedLeaves { get; set; }
        public string EmployeeName { get; set; }
        public long MobileNumber { get; set; }
        public string EmployeeId { get; set; }
        public string BranchName { get; set; }
        public string OfficeTypeName { get; set; }
        public string EmployeeNumber { get; set; }

        public decimal OnDutyToTalLeaves { get; set; }
        public decimal OnDutyConsumedLeaves { get; set; }
        public decimal OnDutyBalanceLeaves { get; set; }

        public decimal CasualTotalLeaves { get; set; }
        public decimal CasualConsumedLeaves { get; set; }
        public decimal CasualBalanceLeaves { get; set; }

        public decimal SickTotalLeaves { get; set; }
        public decimal SickConsumedLeaves { get; set; }
        public decimal SickBalanceLeaves { get; set; }

        public decimal PrivilegeTotalLeaves { get; set; }
        public decimal PrivilegeConsumedLeaves { get; set; }
        public decimal PrivilegeBalanceLeaves { get; set; }
    }
}
