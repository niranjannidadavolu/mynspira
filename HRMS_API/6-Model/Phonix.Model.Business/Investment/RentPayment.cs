namespace Phoenix.Model.Business.Investment
{
    public class RentPayment
    {
        public int RentPaymentId { get; set; }
        public string? OwnerName { get; set; }
        public string? OwnerPan { get; set; }
        public string NoOfMonths { get; set; }
        public string Amount { get; set; }
        public long VerifiedAmount { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
        public string? IsPanVerified { get; set; }
        public string? VerifiedPan { get; set; }
        public string? VerifiedName { get; set; }
    }
}
