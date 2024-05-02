using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class PERSONALINFORMATION
    {
        [JsonPropertyName("last_name")]
        public LastName? last_name { get; set; }

        [JsonPropertyName("middle_name")]
        public MiddleName? middle_name { get; set; }

        [JsonPropertyName("first_name")]
        public FirstName? first_name { get; set; }
    }
}
