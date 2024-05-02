using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class Root
    {
        [JsonPropertyName("status")]
        public string? status { get; set; }

        [JsonPropertyName("message")]
        public string? message { get; set; }

        [JsonPropertyName("timestamp")]
        public long? timestamp { get; set; }

        [JsonPropertyName("data")]
        public Data? data { get; set; }

        [JsonPropertyName("status_code")]
        public string? status_code { get; set; }

        [JsonPropertyName("AadharPath")]
        public string? AadharPath { get; set; }

    }
}
