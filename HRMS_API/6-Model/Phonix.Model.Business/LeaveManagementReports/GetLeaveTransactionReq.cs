using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class GetLeaveTransactionReq
    {
        public int? employeeSLNo { get; set; }
        public int? reportingManagerSlno { get; set; }
        public int statusId { get; set; }
    }
}
