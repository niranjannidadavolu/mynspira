using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class EmployeeItrDetailReport
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
        public string? PanNo { get; set; }


        public string? ItrId { get; set; }
        public string? ItrNumber { get; set; }
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public string? ItrYear { get; set; }
        public string? FilePath { get; set; }
        public string? FileName_Original { get; set; }
        public string? Remarks { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
