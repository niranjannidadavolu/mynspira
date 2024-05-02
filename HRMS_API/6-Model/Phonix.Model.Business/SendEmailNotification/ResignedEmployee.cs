using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.SendEmailNotification
{
    public class ResignedEmployee
    {
        public int SlNo { get; set; }
        public string Branch { get; set; }
        public string EmpNo { get; set; }
        public string Name { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string Dor { get; set; }
        public long BiometriCregNo { get; set; }
        public long MobileNo { get; set; }
        public string OffMailId { get; set; }
    }
}
