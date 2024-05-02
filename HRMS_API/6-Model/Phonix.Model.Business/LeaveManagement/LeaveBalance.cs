namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveBalance
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

        public DateTime DateOfJoin { get; set; }
        public DateTime LeaveApplicableDate { get; set; }

        public decimal OnDutyToTalLeaves { get; set; }
        public decimal OnDutyConsumedLeaves { get; set; }
        public decimal OnDutyBalanceLeaves
        {
            get
            {
                decimal balanceLeaves = 0;
                balanceLeaves = (OnDutyToTalLeaves - OnDutyConsumedLeaves);
                return balanceLeaves;
            }
        }

        public decimal CasualTotalLeaves { get; set; }
        public decimal CasualConsumedLeaves { get; set; }
        public decimal CasualBalanceLeaves
        {
            get
            {
                decimal balanceLeaves = 0;
                balanceLeaves = (CasualTotalLeaves - CasualConsumedLeaves);
                return balanceLeaves;
            }
        }


        public decimal SickTotalLeaves { get; set; }
        public decimal SickConsumedLeaves { get; set; }
        public decimal SickBalanceLeaves
        {
            get
            {
                decimal balanceLeaves = 0;
                balanceLeaves = (SickTotalLeaves - SickConsumedLeaves);
                return balanceLeaves;
            }
        }


        public decimal PrivilegeTotalLeaves { get; set; }
        public decimal PrivilegeConsumedLeaves { get; set; }
        public decimal PrivilegeEncashedLeaves { get; set; }
        public decimal PrivilegeBalanceLeaves
        {
            get
            {
                decimal balanceLeaves = 0;
                balanceLeaves = (PrivilegeTotalLeaves - (PrivilegeConsumedLeaves + PrivilegeEncashedLeaves));
                return balanceLeaves;
            }
        }

    }
}
