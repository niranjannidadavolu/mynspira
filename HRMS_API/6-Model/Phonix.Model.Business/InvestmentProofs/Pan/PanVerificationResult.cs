using Newtonsoft.Json;

namespace Phoenix.Model.Business.InvestmentProofs.Pan;

public class PanVerificationResult
{
    [JsonProperty("code")]
    public string Code;
        
    [JsonProperty("timestamp")]
    public string TimeStamp;
        
    [JsonProperty("transaction_id")]
    public string TransactionId;
        
    [JsonProperty("data")]
    public PanData PanData;
}