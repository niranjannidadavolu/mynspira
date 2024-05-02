
namespace Phoenix.Model.Business.CarLease
{
    public class CarLeaseMaintenancePendingBills
    {
        public int RecordId { get; set; }

        public string? BillType { get; set; }
        public decimal Amount { get; set; }
        public string? BillNo { get; set; }
        public DateTime BillDate { get; set; }
        public string? Remarks { get; set; }
        public string  Status { get; set; }
        public string FilePath { get; set; }
        public string FileName { get; set; }
    }
}
