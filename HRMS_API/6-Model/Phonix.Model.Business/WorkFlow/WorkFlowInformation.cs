namespace Phoenix.Model.Business.WorkFlow
{
    public class WorkFlowInformation
    {
        public int WorkFlowId { get; set; }

        public int WorkFlowTypeId { get; set; }

        public string WorkFlowTypeName { get; set; }

        public int StepTypeId { get; set; }

        public string StepTypeName { get; set; }

        public int StepMasterId { get; set; }

        public string StepMasterName { get; set; }

        public double RangeFrom { get; set; }

        public double RangeTo { get; set; }

        public int DisplayOrder { get; set; }

        public int NextStepMasterId { get; set; }

        public int LevelCount { get; set; }

        public long EmployeeSlno { get; set; }

        public long Reporting_EmployeeSlno { get; set; }
        public int LeaveStatusId { get; set; }
    }
}
