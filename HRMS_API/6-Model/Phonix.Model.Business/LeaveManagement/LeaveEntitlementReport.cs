using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveEntitlementReport
    {
        public string EmployeeID { get; set; }
        public string EmployeeNumber { get; set; }
        public string EmployeeName { get; set; }
        public int BranchSlno { get; set; }
        public string BranchName { get; set; }
        public int OfficeTypeSlno { get; set; }
        public string OfficeTypeName { get; set; }
        public bool IsMarried { get; set; }
        public int ChildCount { get; set; }
        public int LeaveTypeID { get; set; }
        public string LeaveTypeName { get; set; }
        public int TotalLeaves { get; set; }
        public int ConsumedLeaves { get; set; }
        public int OpenningBalance { get; set; }
        public int EncashedLeaves { get; set; }
        public string MaritalStatus
        {
            get
            {
                string maritalStatus = string.Empty;
                if (IsMarried)
                {
                    maritalStatus = "MARRIED";
                }
                else
                {
                    maritalStatus = "UN-MARRIED";
                }
                return maritalStatus;
            }
        }
    }
}
