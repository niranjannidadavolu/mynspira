namespace Phoenix.Model.Business.Investment
{
    public  class EmployeeOtherIncomeDetail
    {
        public int TdsEmpOISlNo { get; set; }
        public int  OthIncomeHeadSlNo { get; set; }
        public string Amount { get; set; }
        public long Tds_Amt { get; set; }
        public long VerifiedAmount { get; set; }
        public string? Description { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
    }

    public class OtherIncome
    {
        public List<OtherIncomeDetail> OtherIncomeDetails { get; set; }
    }

    public class OtherIncomeDetail
    {
        public int OtherIncomeDetailId { get; set; }
        public int OthIncomeHeadId { get; set; }
        public string Amount { get; set; }
        public long TdsAmount { get; set; }
        public long VerifiedAmount { get; set; }
        public string? Description { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
    }
}
