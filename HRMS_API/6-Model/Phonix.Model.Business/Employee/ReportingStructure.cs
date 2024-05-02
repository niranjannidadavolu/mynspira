namespace Phoenix.Model.Business.Employee
{
    public class ReportingStructure
    {
        public int WorkFlowId { get; set; }
        public int StepTypeId { get; set; }
        public int LevelCount { get; set; }
        public int WorkFlowTypeId { get; set; }
        public int DisplayOrder { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmpId { get; set; }
        public int ReportingEmployeeSlno { get; set; }
        public string ReportingEmployeeName { get; set; }
        public string ReportingEmployeeId { get; set; }
        public string WorkEmail { get; set; }
    }
}
