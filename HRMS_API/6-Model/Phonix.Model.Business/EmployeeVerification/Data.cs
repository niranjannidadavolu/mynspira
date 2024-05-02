using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class Data
    {
        [JsonPropertyName("timestamp")]
        public long? timestamp { get; set; }

        [JsonPropertyName("version")]
        public string? version { get; set; }

        [JsonPropertyName("transaction_id")]
        public string? transaction_id { get; set; }

        [JsonPropertyName("consumer_information")]
        public ConsumerInformation? consumer_information { get; set; }

        [JsonPropertyName("idempotency_id")]
        public string? idempotency_id { get; set; }

        [JsonPropertyName("response_metadata")]
        public ResponseMetadata? response_metadata { get; set; }

        [JsonPropertyName("id_verification_report")]
        public object? id_verification_report { get; set; }

        [JsonPropertyName("key_details")]
        public KeyDetails? key_details { get; set; }

        [JsonPropertyName("insights")]
        public Insights? insights { get; set; }
    }
}
