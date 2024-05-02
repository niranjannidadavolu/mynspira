using Microsoft.AspNetCore.DataProtection.KeyManagement;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.EmployeeVerification.Equal
{
    public class InitiateRequest
    {
        public string idempotency_id { get; set; }
        public string gateway_instance_id { get; set; }
        public List<Key> keys { get; set; }
    }

    public class Key
    {
        public List<string> key_id { get; set; }
    }
}
