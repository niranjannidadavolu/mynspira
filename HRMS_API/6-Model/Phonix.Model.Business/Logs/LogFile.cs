using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Logs
{
    public class LogFile
    {
        public string FileName { get; set; }
        public string FileUrl { get; set; }
        public string FileExtension { get; set; }
        public DateTime LastWriteDate { get; set; }
        public DateTime CreatedDate { get; set; }
        public string FolderName { get; set; }

    }
}
