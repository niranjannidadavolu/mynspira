using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class LeaveReportSearchCriteria
    {
        public int? EmployeeSlno { get; set; }
        public string? pBranchSlno { get; set; }
        public int? StatusId { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public List<int> BranchSlno { get; set; }
        public List<DateTime>? ReportRange { get; set; }
        public List<int>? Branches { get; set; }

    }
}
