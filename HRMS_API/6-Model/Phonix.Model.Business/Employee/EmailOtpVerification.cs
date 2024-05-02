using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Employee
{
    public class EmailOtpVerification
    {
        public int OtpEmailId { get; set; }
        public int TemplateId { get; set; }
        public string FromEmployeeEmail { get; set; }
        public string ToEmployeeEmail { get; set; }
        public string Subject { get; set; }
        public bool Status { get; set; }
        public string GeneratedOtp { get; set; }
        public DateTime GeneratedDate { get; set; }
        public string Emailbody { get; set; }

    }
}
