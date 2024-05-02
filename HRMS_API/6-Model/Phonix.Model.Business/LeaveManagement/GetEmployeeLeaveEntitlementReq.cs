namespace Phoenix.Model.Business.LeaveManagement
{
    public class GetEmployeeLeaveEntitlementReq
    {
        public int? OfficeTypeSlno { get; set; }
        public List<int> BranchSlno { get; set; }
        //public int? LeaveInformationId { get; set; }
        public int LeaveTypeId { get; set; }
    }
}
