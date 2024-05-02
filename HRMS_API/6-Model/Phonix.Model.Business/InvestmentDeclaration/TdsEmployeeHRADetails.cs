namespace Phoenix.Model.Business.InvestmentDeclaration
{
    public class TdsEmployeeHRADetails
    {
        public int TdsHraSLNo { get; set; }
        public int TdsEmpSLNo { get; set; }
        public int FinSLNo { get; set; }
        public int EmployeeSLNo { get; set; }
        public int EmpSLNo { get; set; }
        public int UniqueNo { get; set; }
        public string? OwnerName { get; set; }
        public string? OwnerPan { get; set; }
        public string NoOfMonths { get; set; }
        public string Amount { get; set; }
        public long VerifiedAmount { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }

    }
}
