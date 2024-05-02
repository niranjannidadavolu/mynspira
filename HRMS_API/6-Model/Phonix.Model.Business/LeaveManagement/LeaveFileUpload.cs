using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveFileUpload
    {
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
