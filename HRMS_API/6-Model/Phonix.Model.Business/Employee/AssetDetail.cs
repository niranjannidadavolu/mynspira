namespace Phoenix.Model.Business.Employee
{
    public class AssetDetail
    {
        public int Slno { get; set; }
        public string EmpId { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeName { get; set; }
        public string AssetName { get; set; }
        public int Quantity { get; set; }
        public decimal Amount { get; set; }
        public string Configuration { get; set; }
        public string AssetStatus { get; set; }

        public string Branch { get; set; }
        public DateTime? ReturnDate { get; set; }
    }
}
