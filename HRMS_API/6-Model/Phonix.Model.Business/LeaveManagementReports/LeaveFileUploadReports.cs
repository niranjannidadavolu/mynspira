using Phoenix.Model.Business.FileUpload;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagementReports
{
    public class LeaveFileUploadReports
    {
        public string FilePath { get; set; }

        public int FileId { get; set; }

        public int FLeaveId { get; set; }

        public string OriginalFilename { get; set; }

        public string Filename { get; set; }




    }
}
