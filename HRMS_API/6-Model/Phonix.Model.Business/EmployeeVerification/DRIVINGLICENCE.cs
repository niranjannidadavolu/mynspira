using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class DRIVINGLICENCE
    {
        public string key_name { get; set; }
        public string key_status { get; set; }
        public List<KeyDatum> key_data { get; set; }
    }
}
