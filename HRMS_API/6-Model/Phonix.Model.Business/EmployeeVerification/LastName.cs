using System;
using System.Linq;
using System.Text.Json.Serialization;

namespace Phoenix.Model.Business.EmployeeVerification
{
    public class LastName
    {
        [JsonPropertyName("value")]
        public string? value { get; set; }
    }
}
