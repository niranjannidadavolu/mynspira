using System;
using System.Data;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class KeyDetails
    {
        [JsonPropertyName("PAN")]
        public PAN? PAN { get; set; }

        [JsonPropertyName("AADHAAR")]
        public AADHAAR? AADHAAR { get; set; }

        [JsonPropertyName("BANK_ACCOUNT")]
        public BANKACCOUNT? BANK_ACCOUNT { get; set; }

        [JsonPropertyName("DRIVING_LICENCE")]
        public DRIVINGLICENCE? DRIVING_LICENCE { get; set; }
    }
}
