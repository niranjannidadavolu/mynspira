namespace Phoenix.Model.Business.Investment
{
    public class InvestmentDeclaration
    {
        public int EmployeeTdsId { get; set; }
        public long FinancialYearId { get; set; }
        public long EmployeeId { get; set; }
        public int UniqueNumber { get; set; }
        public bool IsVerified { get; set; }
        public InvestmentDetail InvestmentDetail { get; set; }
        public HouseRentAllowance HouseRentAllowance { get; set; }
        //public Chapter6Detail Chapter6Detail { get; set; }
        //public HouseIncome HouseIncomeDetail { get; set; }
        //public OtherIncome OtherIncomeDetail { get; set; }
        public List<OtherIncomeDetail> OtherIncomeDetail { get; set; }
        public List<HousePropertyIncomeDetail> HouseIncomeDetail { get; set; }
        public List<EmployeeChapter6Detail> Chapter6Detail { get; set; }

        public long VerificationEmployeeSlno { get; set; }
        public EmployeeChapter6Detail Section80GDetail { get; set; }
    }
}
