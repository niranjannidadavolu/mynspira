using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phonix.Model.Business.Investment
{
    public  class OtherIncomeDetail : EmployeeDetails
    {
        public int TdsEmpOISlNo { get; set; }
        public int  OthIncomeHeadSlNo { get; set; }
        public long Amount { get; set; }
        public long Tds_Amt { get; set; }
        public long VerifiedAmount { get; set; }
        public string? Description { get; set; }
    }
}
