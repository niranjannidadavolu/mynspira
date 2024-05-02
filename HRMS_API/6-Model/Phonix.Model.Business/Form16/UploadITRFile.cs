using Phoenix.Model.Business.FileUpload;
using Phoenix.Model.Business.LeaveManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Form16
{

    public class GetITRFile
    {
        public int ItrId { get; set; }
        public int EmployeeSlno { get; set; }
        public string ItrNumber { get; set; }
        public int ItrYear { get; set; }
        public string Remarks { get; set; }
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public string FileName { get; set; }
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }

    }
    public class UploadITRFile
    {
        public int EmployeeSlno { get; set; }
        public string ItrNumber { get; set; }
        public int Year { get; set; }
        public string Remarks { get; set; }
        public string?   FileName { get; set; }
        public string FileName_Original { get; set; }
        public string? FilePath { get; set; }
        //public bool Status { get; set; }
        public FileToUpload FileToUpload { get; set; }
        //public List<ITRFileUpload> FileUploads { get; set; }
    }
    public class ITRFileUpload
    {
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
