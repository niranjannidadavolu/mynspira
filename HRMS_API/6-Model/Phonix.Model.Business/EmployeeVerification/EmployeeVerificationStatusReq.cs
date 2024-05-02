using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class EmployeeVerificationStatusReq
    {
        public int StatusId { get; set; }
        public int EmployeeSlno { get; set; }
        public string IdempotencyId { get; set; }
        public int ApprovedBy { get; set; }
        public string ApprovedRemarks { get; set; }
        public int LockBankDetails { get; set; }


    }
}
