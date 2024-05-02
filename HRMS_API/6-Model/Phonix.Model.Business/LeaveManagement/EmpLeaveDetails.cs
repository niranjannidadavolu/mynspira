namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmpLeaveDetails
    {
        public int EmployeeSlno { get; set; }
        public int EmployeeLeaveId { get; set; }      
        public DateTime LeaveDate { get; set; }
        public int LeaveDayTypeId { get; set; }
        public int LeaveStatusId { get; set; }
        public string Remarks { get; set; }
        public string RowVersion { get; set; }
        public string CreatedBy { get; set; } 
    }
}