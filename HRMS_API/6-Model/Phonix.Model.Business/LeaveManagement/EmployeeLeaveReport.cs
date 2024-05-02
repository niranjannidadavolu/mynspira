using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmployeeLeaveReport
    {
        public int LeaveId { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeId { get; set; }
        public string EmployeeNumber { get; set; }
        public string EmployeeName { get; set; }
        public int BranchSlno { get; set; }
        public string BranchName { get; set; }
        public int OfficeTypeSlno { get; set; }
        public string OfficeTypeName { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
        public DateTime AppliedOn { get; set; }
        public string LeaveCode { get; set; }
        public int TotalDays { get; set; }
        public string LeaveTypeName { get; set; }
        public string LeaveRemarks { get; set; }
        public string L1_EmployeeId { get; set; }
        public string L1_EmployeeName { get; set; }
        public string L1_EmployeeNumber { get; set; }
        public string L1_Leave_Status_Name { get; set; }
        public DateTime? L1_Leave_Approved_Date { get; set; }
        public string L1_Leave_Remarks { get; set; }

        public string L2_EmployeeId { get; set; }
        public string L2_EmployeeName { get; set; }
        public string L2_EmployeeNumber { get; set; }
        public string L2_Leave_Status_Name { get; set; }
        public DateTime? L2_Leave_Approved_Date { get; set; }
        public string L2_Leave_Remarks { get; set; }

        public string L3_EmployeeId { get; set; }
        public string L3_EmployeeName { get; set; }
        public string L3_EmployeeNumber { get; set; }
        public string L3_Leave_Status_Name { get; set; }
        public DateTime? L3_Leave_Approved_Date { get; set; }
        public string L3_Leave_Remarks { get; set; }

        public EmployeeLeaveReport()
        {
            EmployeeId = string.Empty;
            EmployeeNumber = string.Empty;
            EmployeeName = string.Empty;
            BranchName = string.Empty;
            OfficeTypeName = string.Empty;
            L1_EmployeeId = string.Empty;
            L1_EmployeeName = string.Empty;
            L1_EmployeeNumber = string.Empty;
            L1_Leave_Status_Name = string.Empty;
            L2_EmployeeId = string.Empty;
            L2_EmployeeName = string.Empty;
            L2_EmployeeNumber = string.Empty;
            L2_Leave_Status_Name = string.Empty;
            L3_EmployeeId = string.Empty;
            L3_EmployeeName = string.Empty;
            L3_EmployeeNumber = string.Empty;
            L3_Leave_Status_Name = string.Empty;
            LeaveCode = string.Empty;
        }
    }
}
