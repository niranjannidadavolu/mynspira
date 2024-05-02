using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmpLeavePolicyDetails
    {
        public int LeaveId { get; set; }
        public int EntitlementId { get; set; }
        public int ConsumedLeaves { get; set; }
        public int Employeeslno { get; set; }
        public int LeaveStatusId { get; set; }
        public string LeaveStatusName { get; set; }
        public int LeavetypeId { get; set; }
        public string LeavetypeName { get; set; }
        public int PolicyId { get; set; }
        public int LowerBound { get; set; }
        public int UpperBound { get; set; }
        public int ApplyBeforeDays { get; set; }
        public int MaxConcecutiveDays { get; set; }
        public bool AllowAfterMaxConcecutive { get; set; }
        public bool CanBeMergedWithOther { get; set; }
        public int MaximumUsage { get; set; }
        public int StatusId { get; set; }
        public int ApplicableTo { get; set; }
        public bool CanApplyHalfDay { get; set; }
        public bool IsWeekEndHoliDays { get; set; }
        public double TotalLeaves { get; set; }
        public double LeaveBalance
        {
            get
            {
                double balance = TotalLeaves - ConsumedLeaves;
                return balance;
            }
        }

        public int BranchSlno { get; set; }
        public bool IsDocumentRequired { get; set; }

    }
}
