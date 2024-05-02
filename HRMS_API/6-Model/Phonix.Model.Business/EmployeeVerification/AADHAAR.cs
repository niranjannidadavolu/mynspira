using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.EmployeeVerification
{
    // Root myDeserializedClass = JsonSerializer.Deserialize<Root>(myJsonResponse);
    public class AADHAAR
    {
        [JsonPropertyName("key_name")]
        public string? key_name { get; set; }

        [JsonPropertyName("key_status")]
        public string? key_status { get; set; }

        [JsonPropertyName("key_data")]
        public List<KeyDatum>? key_data { get; set; }
    }
}
