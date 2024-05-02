using System.Diagnostics.SymbolStore;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Model.Business.Masters
{
    public class LeaveType
    {
        public int LeaveTypeId { get; set; }
        public string? LeaveTypeName { get; set; }
        public string? LeaveTypeCode { get; set; }
        public int IsPaidLeave { get; set; }

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
        public double ConsumedLeaves { get; set; }
        public double EnCashedLeaves { get; set; }
        public bool CheckForHoliday { get; set; }
        public double LeaveBalance
        {
            get
            {
                double balance = TotalLeaves - (ConsumedLeaves + EnCashedLeaves);
                return balance;
            }
        }

        public int EntitlementId { get; set; }
        public int BranchSlno { get; set; }
        public bool IsDocumentRequired
        {
            get
            {
                bool isDocumentRequired = false;
                if (NeedCertificate > 0)
                {
                    isDocumentRequired = true;
                }
                return isDocumentRequired;
            }

        }
        public bool ShowInDashboard { get; set; }
        public bool IsDisabled
        {
            get
            {

                bool isDisabled = false;
                LeaveTypeNames leaveType = (LeaveTypeNames)LeaveTypeId;
                switch (leaveType)
                {
                    case LeaveTypeNames.MARRIAGE_LEAVE:
                    case LeaveTypeNames.COVID_LEAVE:
                    case LeaveTypeNames.BEREAVEMENT_LEAVE:
                    case LeaveTypeNames.SPECIAL_CASUAL_LEAVE:
                    case LeaveTypeNames.SPECIAL_SICK_LEAVE:
                    case LeaveTypeNames.COMPENSATORY_OFF:
                    case LeaveTypeNames.EARLY_LOGOUT_TIME:
                    case LeaveTypeNames.PATERNITY_LEAVE:
                    case LeaveTypeNames.MATERNITY_LEAVE:
                        isDisabled = true;
                        break;
                }
                return isDisabled;

            }
        }
        public DateTime DateValidFrom { get; set; }
        public DateTime DateValidUntil { get; set; }
        public int NeedCertificate { get; set; }

        public int ReasonCount { get; set; }
        public bool ShowToManager { get; set; }

        public List<LeaveTypeReason>? LeaveTypeReasons { get; set; }
    }
}