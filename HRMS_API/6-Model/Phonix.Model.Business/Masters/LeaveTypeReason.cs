using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Masters
{
    public class LeaveTypeReason
    {
        public int ReasonId { get; set; }

        public string Reason { get; set; }

        public int LeaveTypeId { get; set; }

        public bool Status { get; set; }

    }
}
