using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class KeyDatum
    {
        [JsonPropertyName("key_name")]
        public string? key_name { get; set; }

        [JsonPropertyName("gender")]
        public string? gender { get; set; }

        [JsonPropertyName("key_id")]
        public string? key_id { get; set; }

        [JsonPropertyName("dob")]
        public string? dob { get; set; }

        [JsonPropertyName("name")]
        public string? name { get; set; }

        [JsonPropertyName("key_report")]
        public string? key_report { get; set; }

        [JsonPropertyName("key_buid")]
        public string? key_buid { get; set; }

        [JsonPropertyName("key_provider")]
        public string? key_provider { get; set; }

        [JsonPropertyName("key_global_uid")]
        public string? key_global_uid { get; set; }

        [JsonPropertyName("key_source")]
        public string? key_source { get; set; }

        [JsonPropertyName("key_fetched_at")]
        public DateTime? key_fetched_at { get; set; }

        [JsonPropertyName("address_area")]
        public string? address_area { get; set; }

        [JsonPropertyName("equal_artefact")]
        public string? equal_artefact { get; set; }

        [JsonPropertyName("address")]
        public string? address { get; set; }

        [JsonPropertyName("address_house")]
        public string? address_house { get; set; }

        [JsonPropertyName("address_country")]
        public string? address_country { get; set; }

        [JsonPropertyName("address_state")]
        public string? address_state { get; set; }

        [JsonPropertyName("photo")]
        public string? photo { get; set; }

        [JsonPropertyName("verification_type")]
        public string? verification_type { get; set; }

        [JsonPropertyName("co")]
        public string? co { get; set; }

        [JsonPropertyName("address_pincode")]
        public string? address_pincode { get; set; }

        [JsonPropertyName("issuer_name")]
        public string? issuer_name { get; set; }

        [JsonPropertyName("address_landmark")]
        public string? address_landmark { get; set; }

        [JsonPropertyName("address_street")]
        public string? address_street { get; set; }

        [JsonPropertyName("address_district")]
        public string? address_district { get; set; }

        [JsonPropertyName("account_number")]
        public string? account_number { get; set; }

        [JsonPropertyName("branch_name")]
        public string? branch_name { get; set; }

        [JsonPropertyName("bank_name")]
        public string? bank_name { get; set; }

        [JsonPropertyName("ifsc")]
        public string? ifsc { get; set; }


        
    }
}
