using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class SaveEmployeeLeaveEntitlementReq
    {
        // public int EmployeeLeaveEntitlementId { get; set; }
        public int EmployeeSlno { get; set; } // CREATED BY
        public int LeaveInformationId { get; set; }
        public int YearOfLeave { get; set; }
        public DateTime? FromDate
        {
            get
            {
                DateTime fromDate = DateValidFrom.ToDateTimeOrDefault();
                return fromDate;
            }
        }
        public DateTime? ToDate
        {
            get
            {
                DateTime toDate = DateValidUntil.ToDateTimeOrDefault();
                return toDate;
            }
        }
        public string DateValidFrom { get; set; }
        public string DateValidUntil { get; set; }
        public int TotalLeaves { get; set; }
        public int ConsumedLeaves { get; set; }
        public int OriTotalLeaves { get; set; }
        public DateTime LeavePostedDate { get; set; }
        public DateTime NextLeavePostingDate { get; set; }
        public int StatusId { get; set; }
        public int OfficeTypeSlno { get; set; }
        public int PBranchSlno { get; set; }
        public int LeaveTypeId { get; set; }

    }
}
