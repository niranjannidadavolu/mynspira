using System.Net.Http.Headers;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveWorkFlow
    {
        public int LeaveId { get; set; }
        public string LeaveNumber { get; set; }
        public DateTime AssignedDate { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public string ApprovedRemarks { get; set; }
        public int LeaveStatusId { get; set; }
        public string LeaveStatusName { get; set; }
        public int StepMasterId { get; set; }
        public string StepMasterName { get; set; }
        public int StepTypeId { get; set; }
        public string StepTypeName { get; set; }
        public int WorkFlowTypeId { get; set; }
        public string WorkFlowTypeName { get; set; }
        public int ReportingEmployeeSlno { get; set; }
        public string ReportingEmployeeId { get; set; }
        public string ReportingEmployeeName { get; set; }
        public decimal RangeFrom { get; set; }
        public decimal RangeTo { get; set; }
        public string UniqueNumber
        {
            get
            {
                string uniqueNumber = string.Format("{0}-{1}", LeaveId, StepMasterId);
                return uniqueNumber;
            }
        }

        public LeaveWorkFlow()
        {
            LeaveNumber = string.Empty;
            ApprovedRemarks = string.Empty;
            LeaveStatusName = string.Empty;
            StepMasterName = string.Empty;
            StepTypeName = string.Empty;
            WorkFlowTypeName = string.Empty;
            ReportingEmployeeId = string.Empty;
        }
    }
}
