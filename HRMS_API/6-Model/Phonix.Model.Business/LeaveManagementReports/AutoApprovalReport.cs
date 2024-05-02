using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class AutoApprovalReport
    {
        public string EmpNo { get; set; }
        public string EmpId { get; set; }
        public DateTime LeaveFrom { get; set; }
        public DateTime LeaveTo { get; set; }
        public string? EmployeeName { get; set; }
        public string BranchName { get; set; }
        public DateTime LeaveDate { get; set; }
        public string? Remarks { get; set; }
        public string? LeaveTypeName { get; set; }
        public int ReportingEmployeeSlno { get; set; }
        public string? ReportingEmployeeName { get; set; }
        public string? ReportingEmployeeID { get; set; }
        

    }
}
