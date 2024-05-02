namespace Phoenix.Model.Business.LeaveAutoApproval
{
    public class AutoApprovalDetails
    {
        public int EmployeeSno { get; set; }
        public int LeaveId { get; set; } 
        public int WorkflowTypeId { get; set; }
        public int StepTypeId { get; set; }
        public int StepMasterId { get; set; }
        public int LeaveStatusId { get; set; }
        public int AssignedTo { get; set; }
        public DateTime AssignedDate { get; set; }
        public DateTime ApprovedDate { get; set; }
        public string Remarks { get; set; }
        public int LeaveTypeId { get; set; }
        public DateTime LeaveTo { get; set; }
        public DateTime LeaveFrom { get; set;}

            
    }
}
