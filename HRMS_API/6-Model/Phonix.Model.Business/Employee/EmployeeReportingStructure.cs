namespace Phoenix.Model.Business.Employee
{
    public class EmployeeReportingStructure
    {
        public int EmployeeSlno { get; set; }
        public string EmployeeId { get; set; }
        public string EmployeeNumber { get; set; }
        public string EmployeeName { get; set; }
        public string BranchName { get; set; }
        public string OfficeTypeName { get; set; }

        public string L1_EmployeeId { get; set; }
        public string L1_EmployeeName { get; set; }
        public string L1_EmployeeNumber { get; set; }

        public string L2_EmployeeId { get; set; }
        public string L2_EmployeeName { get; set; }
        public string L2_EmployeeNumber { get; set; }

        public string L3_EmployeeId { get; set; }
        public string L3_EmployeeName { get; set; }
        public string L3_EmployeeNumber { get; set; }

        public EmployeeReportingStructure()
        {
            EmployeeId = string.Empty;
            EmployeeNumber = string.Empty;
            EmployeeName = string.Empty;
            BranchName = string.Empty;
            OfficeTypeName = string.Empty;
            L1_EmployeeId = string.Empty;
            L1_EmployeeName = string.Empty;
            L1_EmployeeNumber = string.Empty;
            L2_EmployeeId = string.Empty;
            L2_EmployeeName = string.Empty;
            L2_EmployeeNumber = string.Empty;
            L3_EmployeeId = string.Empty;
            L3_EmployeeName = string.Empty;
            L3_EmployeeNumber = string.Empty;
        }
    }
}
