

namespace Phoenix.Model.Business.Reimbursement
{
    public class ApprovedReimbursement
    {
        public string? MonthName { get; set; }
        public decimal Amount { get; set; }
        public decimal Paid { get; set; }
        public decimal Balance { get; set; }
        public int RecordId { get; set; }
        public decimal TotalAmount { get; set; }
    }
}
