using Phoenix.Model.Business.Administration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class UpdateMultipleEmployeeLeaveStatusReq
    {
        public string? ApprovedRemarks { get; set; }
        public List<int> LeaveId { get; set; }
        public int ApprovedBy { get; set; }
        public int LeaveStatusId { get; set; }

        //  public List<EmployeeLeaveStatus> EmployeeLeaveStatus { get; set; }

    }
    public class EmployeeLeaveStatus
    {
        public int LeaveId { get; set; }
        public int LeaveStatusId { get; set; }
        public int EmployeeSlno { get; set; }
        public int WorkFlowTypeId { get; set; }
        public int StepTypeId { get; set; }
        public int StepMasterId { get; set; }
        public string? ApprovedRemarks { get; set; }

    }
}
