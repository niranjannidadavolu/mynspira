using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Phoenix.Model.Business.InvestmentProofs.Pan
{
    public class PanVerify
    {
        [JsonProperty("pan")] 
        public string Pan; // Mandatory
        
        [JsonProperty("consent")] 
        public string Consent; // Mandatory
        
        [JsonProperty("reason")] 
        public string Reason; // Mandatory
    }
}
