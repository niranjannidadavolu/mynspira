namespace Phoenix.Model.Business.Employee
{
    public class EmployeePhoneNumber
    {
        public long Slno { get; set; }
        public long EmployeeSlno { get; set; }
        public string EmpId { get; set; }
        public string EmployeeName { get; set; }
        public string Company { get; set; }
        public long Mobile { get; set; }

        public EmployeePhoneNumber()
        {
            EmpId = string.Empty;
            EmployeeName = string.Empty;
            Company = string.Empty;
        }
    }
}
