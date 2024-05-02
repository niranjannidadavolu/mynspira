namespace Phoenix.Model.Business.Investment
{
    public  class TdsEmployeeSubHeadDetails
    {
        public int  TdsEmpSHSLNo { get; set; }
        public int  TdsEmpSLNo { get; set; }
        public int  FinSLNo { get; set; }
        public int  EmployeeSLNo { get; set; }
        public int  EmpSLNo { get; set; }
        public int  UniqueNo { get; set; }
        public int  SubHeadSLNo { get; set; }
        public decimal  Amount { get; set; }
        public decimal VerifiedAmount { get; set; }
        public string? Section1   { get; set; }
        public string? PARTICULARS { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
        public string? isPanVerified { get; set; }
        public string? VerifiedName { get; set; }
        public string? VerifiedPan { get; set; }

    }
}
