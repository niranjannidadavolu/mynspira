using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmpLeaveCancelRequest
    {
        public  int LeaveId { get;set;}
        public int LeaveDayTypeId { get; set; }
        public int LeaveStatusId { get; set; }
        public string? Remarks { get; set; }
        public int? EmployeeSlno { get; set; }
        public  int EntitlementId { get;set;}
        public  int ConsumedLeaves { get;set;}
        public  int TotalDaysTaken { get;set;}

    }
}
