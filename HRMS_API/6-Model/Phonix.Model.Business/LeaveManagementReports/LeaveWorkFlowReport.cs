using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class LeaveWorkFlowReport
    {
        public int EmployeeSlno { get; set; }

        public int RLeaveId { get; set; }
        public string EmployeeNumber { get; set; }
        public string ReportingEmployeeNumber { get; set; }
        public string ReportingEmployeeName { get; set; }
        public int StepId { get; set; }
        public int WorkFlowTypeId { get; set; }
        public int StepTypeId { get; set; }
        public int LeaveStatusId { get; set; }
        public int WLeaveTypeId { get; set; }
        public string WLeaveStatusName { get; set; }
        public string? WLeaveTypeName { get; set; }
        public int AssignedTo { get; set; }
        public DateTime AssignedDate { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public string ApprovedRemarks { get; set; }
        public DateTime AppliedDate { get; set; }
        public string AppliedRemarks { get; set; }
        public DateTime DateLeaveFrom { get; set; }
        public DateTime? DateLeaveTo { get; set; }
        public int EleaveStatusId { get; set; }


    }
}
