
namespace Phoenix.Model.Business.CarLease
{
    public class CarLeaseMaintenanceBalance
    {
        public CarLeaseMaintenanceBalance()
        {
            Salary_Voucher=string.Empty;
            Monthname=string.Empty;
        }        
        public int EmpCarLeasedDtSlno { get; set; }
        public string Salary_Voucher { get; set; }
        public string Monthname { get; set; }
        public decimal ToBePaid { get; set; }
        public decimal Paid { get; set; }
        public decimal Balance { get; set; }
        public decimal TotalAmount { get; set; }
    }
}
