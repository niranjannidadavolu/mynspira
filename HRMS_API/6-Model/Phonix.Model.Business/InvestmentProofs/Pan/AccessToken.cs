using Newtonsoft.Json;

namespace Phoenix.Model.Business.InvestmentProofs.Pan;

public class AccessToken
{
    [JsonProperty("access_token")] 
    public string AccessTokenValue; // Mandatory
}