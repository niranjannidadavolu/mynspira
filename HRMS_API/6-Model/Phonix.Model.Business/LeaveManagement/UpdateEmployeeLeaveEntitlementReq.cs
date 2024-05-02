using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class UpdateEmployeeLeaveEntitlementReq
    {
        public int EmployeeLeaveEntitlementId { get; set; }
        public int? EmployeeSlno { get; set; }
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
        public int StatusId { get; set; }
        public int UpdatedBy { get; set; }

    }
}
