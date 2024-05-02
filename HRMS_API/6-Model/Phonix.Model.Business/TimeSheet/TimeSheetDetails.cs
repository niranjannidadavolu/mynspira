namespace Phoenix.Model.Business.TimeSheet
{
    internal class TimeSheetDetails
    {
    }

    public class TaskInformation
    {
        public int TaskId { get; set; }
        public string TaskName { get; set; }
        public string Description { get; set; }
        public string TaskCode { get; set; }

    }
    public class TimeSheetProjectDetails
    {
        public int ProjectId { get; set; }
        public string ProjectCode { get; set; }
        public string ProjectName { get; set; }
        public string Description { get; set; }
        public int UserId { get; set; }

        public List<TaskInformation> TaskInformation { get; set; }

    }
}
