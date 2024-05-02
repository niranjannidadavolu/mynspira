namespace Phoenix.Model.Business.Employee
{
    public class AddressDetail
    {
        public int Slno { get; set; }
        public string EmpId { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeName { get; set; }

        public string PHNo { get; set; }
        public string PStreetVill { get; set; }
        public string PDistrict { get; set; }
        public string PState { get; set; }
        public string TStreetVill { get; set; }
        public string TDistrict { get; set; }
        public string TState { get; set; }
        public string THNo { get; set; }
        public int? PPIN { get; set; }
        public int? TPIN { get; set; }
        public string PPhoneNo { get; set; }
        public string TPhoneNo { get; set; }
    }

}
