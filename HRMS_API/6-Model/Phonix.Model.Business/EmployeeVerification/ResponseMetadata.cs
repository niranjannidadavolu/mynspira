using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class ResponseMetadata
    {
        [JsonPropertyName("partnerId")]
        public string? partnerId { get; set; }
    }
}
