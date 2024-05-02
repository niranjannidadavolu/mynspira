using Newtonsoft.Json;

namespace Phoenix.Model.Business.InvestmentProofs.Pan;

public class PanData
{
    [JsonProperty("@entity")]
    public string Entity { get; set; }

    [JsonProperty("pan")] 
    public string Pan { get; set; }
        
    [JsonProperty("first_name")] 
    public string FirstName { get; set; }
        
    [JsonProperty("middle_name")] 
    public string MiddleName { get; set; }
        
    [JsonProperty("last_name")] 
    public string LastName { get; set; }
        
    [JsonProperty("full_name")] 
    public string FullName { get; set; }
        
    [JsonProperty("status")] 
    public string Status { get; set; }
        
    [JsonProperty("aadhaar_seeding_status")] 
    public string AadhaarSeedingStatus { get; set; }
        
    [JsonProperty("category")] 
    public string Category { get; set; }
        
    [JsonProperty("last_updated")] 
    public string LastUpdated { get; set; }
}