using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.EmployeeVerification.Equal
{
    public class TokenResponse
    {
        public string status { get; set; }
        public object message { get; set; }
        public object error_code { get; set; }
        public object status_code { get; set; }
        public bool is_retryable { get; set; }
        public string token { get; set; }
    }
}
