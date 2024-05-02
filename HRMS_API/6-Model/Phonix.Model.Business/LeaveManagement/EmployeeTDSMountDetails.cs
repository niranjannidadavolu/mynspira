using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagement
{
   
    public class EmployeeTDSMountDetails
    {
        public int BranchSlno { get; set; }
        public int EmpSlno { get; set; }
        public int Uniqueno { get; set; }
        public int FinSlno { get; set; }
        public int AppliedAmount { get; set; }
        //public int otdsAmount { get; set; }
    }
    public class EmployeeTDSAmounts
    {
        public decimal CarLeaseAmount { get; set; }
        public decimal TotalSalary { get; set; }
        public decimal BasicSalary { get; set; }
        public decimal DaySalary { get; set; }
    }
    public class EmployeeTDSAmountDetailsRes
    {
        public decimal CarLeaseAmount { get; set; }
        public decimal TotalSalary { get; set; }
        public decimal BasicSalary { get; set; }
        public decimal DaySalary { get; set; }
    }
}
