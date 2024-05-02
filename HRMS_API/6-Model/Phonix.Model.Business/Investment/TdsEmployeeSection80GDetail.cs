namespace Phoenix.Model.Business.Investment
{
    public class TdsEmployeeSection80GDetail
    {
        public int TDS80GSLNO { get; set; }
        public int TDSEMPSLNO { get; set; }
        public int FINSLNO { get; set; }
        public int EMPLOYEESLNO { get; set; }
        public int EMPSLNO { get; set; }
        public int UNIQUENO { get; set; }
        public int ORGSLNO { get; set; }
        public string? ORG_NAME { get; set; }
        public string? ORG_PAN { get; set; }
        public decimal Amount { get; set; }
        public decimal VerifiedAmount { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
        public string? IsPanVerified { get; set; }
        public string? VerifiedName { get; set; }
        public string? VerifiedPan { get; set; }
    }
}
