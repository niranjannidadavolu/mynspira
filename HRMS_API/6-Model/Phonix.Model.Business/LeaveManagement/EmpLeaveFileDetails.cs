
namespace Phoenix.Model.Business.LeaveManagement
{
    public class EmpLeaveFileDetails
    {
        public int FileId { get; set; }
        public int LeaveId { get; set; }
        public string OriginalFileName { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
    }
}
