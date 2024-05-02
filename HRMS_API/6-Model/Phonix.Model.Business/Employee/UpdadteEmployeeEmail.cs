using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Employee
{
    public class UpdadteEmployeeEmail
    {
        public int EmployeeSlno { get; set; }
        public string PersonalEmail { get; set; }
        public string WorkEmail { get; set; }
        public string GeneratedOtp { get; set; }
    }
}
