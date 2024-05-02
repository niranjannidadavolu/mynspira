namespace Phoenix.Model.Business.Investment
{
    public class Section80GDetail
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
        public Section80GFile? FileInfo { get; set;}

        public string? IsPanVerified { get; set; }
        public string? VerifiedPan { get; set; }
        public string? VerifiedName { get; set; }
        public int TDSEMPSHSLNO { get; set; }
    }

    public class Section80GFile
    {
        public int TDS80GFILESLNO { get; set; }
        public int TDS80GSLNO { get; set; }
        public string FILENAME { get; set; }
        public string FILENAME_ORIGINAL { get; set; }
        public string FILEPATH { get; set; }
    }
}
