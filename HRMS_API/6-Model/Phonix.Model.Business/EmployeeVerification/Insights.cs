using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class Insights
    {
        [JsonPropertyName("PERSONAL_INFORMATION")]
        public PERSONALINFORMATION? PERSONAL_INFORMATION { get; set; }
    }
}
