namespace Phoenix.Model.Business.InvestmentDeclaration
{
    public class TdsEmployeeSubHeadDetails
    {
        public int TdsEmpSHSLNo { get; set; }
        public int TdsEmpSLNo { get; set; }
        public int FinSLNo { get; set; }
        public int EmployeeSLNo { get; set; }
        public int EmpSLNo { get; set; }
        public int UniqueNo { get; set; }
        public int SubHeadSLNo { get; set; }
        public string Amount { get; set; }
        public long VerifiedAmount { get; set; }
        public string? Section1 { get; set; }
        public string? PARTICULARS { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
    }
}
