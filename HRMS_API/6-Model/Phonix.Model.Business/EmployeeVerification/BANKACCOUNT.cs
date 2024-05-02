using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class BANKACCOUNT
    {
        [JsonPropertyName("key_name")]
        public string? key_name { get; set; }

        [JsonPropertyName("key_status")]
        public string? key_status { get; set; }

        [JsonPropertyName("key_data")]
        public List<KeyDatum>? key_data { get; set; }
    }
}
