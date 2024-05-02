using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class ConsumerInformation
    {
        [JsonPropertyName("consumer_id")]
        public string? consumer_id { get; set; }

        [JsonPropertyName("mobile")]
        public string? mobile { get; set; }
    }
}
