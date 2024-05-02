using System.Text.Json.Serialization;

namespace Phonix.CrossCutting.Utils.Token
{
    public class JwtTokenConfig
    {
        [JsonPropertyName("JwtKey")]
        public string Secret { get; set; }

        [JsonPropertyName("JwtIssuer")]
        public string Issuer { get; set; }

        [JsonPropertyName("Jwtaudience")]
        public string Audience { get; set; }

        [JsonPropertyName("JwtExpireHours")]
        public decimal AccessTokenExpiration { get; set; }

        [JsonPropertyName("refreshTokenExpiration")]
        public decimal RefreshTokenExpiration { get; set; }
    }
}
