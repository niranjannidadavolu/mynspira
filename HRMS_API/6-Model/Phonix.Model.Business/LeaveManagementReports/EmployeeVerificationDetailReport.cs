using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class EmployeeVerificationDetailReport
    {
        public int EmployeeSlno { get; set; }
        public string? EmployeeName { get; set; }
        public long MobileNumber { get; set; }
        public string? WorkEmail { get; set; }
        public string EmpId { get; set; }
        public string BranchName { get; set; }
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public DateTime DOJ { get; set; }
        public DateTime DOB { get; set; }

        public string? Remarks { get; set; }
        public DateTime ApprovedOn { get; set; }
        public string? Aadhaar { get; set; }
        public string? Pan { get; set; }
        public string? BankAccount { get; set; }
        public string IdempotencyId { get; set; }
        public string? AadharPath { get; set; }
        public string? AadharNo { get; set; }
        public string? Gender { get; set; }
    }
    public class EmployeePanVerificationDetailReport
    {
        public int EmployeeSlno { get; set; }
        public string? EmployeeName { get; set; }
        public long MobileNumber { get; set; }
        public string EmpId { get; set; }
        public string BranchName { get; set; }
        public DateTime DOJ { get; set; }
        public DateTime DOB { get; set; }
        public string? Gender { get; set; }
        public string? EmpNo { get; set; }
        public string? OldPanNumber { get; set; }


        public string? PanId { get; set; }
        public string? PanNumber { get; set; }
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public string? FilePath { get; set; }
        public string? FileName_Original { get; set; }
        public string? Remarks { get; set; }
        public DateTime CreatedDate { get; set; }

    }
}
