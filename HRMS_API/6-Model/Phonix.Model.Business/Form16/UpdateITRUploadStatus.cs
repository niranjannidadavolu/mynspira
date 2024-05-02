using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Form16
{
    public class UpdateITRUploadStatus
    {
        public int ItrId { get; set; }
        public int StatusId { get; set; }
        public int EmployeeSlno { get; set; }
        public int ApprovedBy { get; set; }
        public string ApprovedRemarks { get; set; }
    }
}
