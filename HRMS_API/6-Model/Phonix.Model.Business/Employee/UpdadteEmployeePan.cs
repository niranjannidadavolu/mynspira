using Phoenix.Model.Business.FileUpload;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Employee
{
    public class UpdadteEmployeePan
    {
        public int EmployeeSlno { get; set; }
        public string PanNumber { get; set; }
        public string? FileName { get; set; }
        public string FileName_Original { get; set; }
        public string? FilePath { get; set; }
        //public bool Status { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
