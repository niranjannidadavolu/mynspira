
namespace Phoenix.Model.Business.Reimbursement
{
    public class PendingReimbursement
    {
        public DateTime BillDate { get; set; }
        public decimal Amount { get; set; }
        public bool IsApproved { get; set; }
        public string FilePath { get; set; }
        public string FileName { get; set; }
        public int RecordId { get; set; }
        public string BillNo { get; set; }
        public string Status { get; set; }
        public string Remarks { get; set; }
    }
}
