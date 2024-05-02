namespace Phoenix.Model.Business.Investment
{
    public class EmployeeHouseIncomeDetail
    {
        public int TdsEmpHISlNo { get; set; }
        public int HouseIncomeHeadSlNo { get; set; }
        public string Amount { get; set; }
        public long VerifiedAmount { get; set; }
        public string Description { get; set; }
        public string BANK_PANNO { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
        public string? isPanVerified { get; set; }
        public string? VerifiedName { get; set; }
        public string? VerifiedPan { get; set; }
    }
}
