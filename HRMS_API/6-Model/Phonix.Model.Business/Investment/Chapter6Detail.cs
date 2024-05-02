namespace Phoenix.Model.Business.Investment
{
    public  class Chapter6Detail
    {
        public List<EmployeeChapter6Detail> EmployeeChapter6Details { get; set; }
    }

    public class EmployeeChapter6Detail
    {
        public int? Chapter6DetailId { get; set; }
        public int? SubHeadId { get; set; }
        public decimal Amount { get; set; }
        public decimal VerifiedAmount { get; set; }
        public string? SectionName { get; set; }
        public string? Particulars { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
        public string? IsPanVerified { get; set; }
        public string? VerifiedPan { get; set; }
        public string? VerifiedName { get; set; }
        public List<Section80GDetail>? Section80GDetails { get; set; }
    }
}
