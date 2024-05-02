namespace Phoenix.Model.Business.Investment
{
    public class HouseIncome
    {
        public List<HousePropertyIncomeDetail> HousePropertyIncomeDetails { get; set; }
    }

    public class HousePropertyIncomeDetail
    {
        public int HouseIncomeDetailId { get; set; }
        public int HouseIncomeHeadId { get; set; }
        public string Amount { get; set; }
        public long VerifiedAmount { get; set; }
        public string Description { get; set; }
        public string PanNumber { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
        public string? IsPanVerified { get; set; }
        public string? VerifiedPan { get; set; }
        public string? VerifiedName { get; set; }

    }
}
