using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

using Microsoft.IdentityModel.Tokens;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.Administration;

namespace Phoenix.CrossCutting.Jwt
{
    public class TokenService : ITokenService
    {
        private const double EXPIRY_DURATION_MINUTES = 30;
        
        public string BuildToken(JwtMetaData metaData, UserInformation loginUser)
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.GivenName, loginUser.CustomizedId),
                new Claim(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.Upn, loginUser.CustomizedId)
            };

            // Add roles as multiple claims
            if (loginUser.UserRoles != null)
            {
                foreach (var role in loginUser.UserRoles)
                {
                    claims.Add(new Claim(ClaimTypes.Role, role.RoleName));
                }
            }
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(metaData.JWtKey));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);
            var tokenDescriptor = new JwtSecurityToken(metaData.Issuer, metaData.Audience, claims, notBefore: null, expires: DateTime.Now.AddMinutes(metaData.JwtExpiration * 60), signingCredentials: credentials);
            return new JwtSecurityTokenHandler().WriteToken(tokenDescriptor);
        }

        //public string BuildToken(string key, string issuer, UserInformation loginUser)
        //{
        //    var claims = new List<Claim>
        //    {
        //        new Claim(ClaimTypes.GivenName, loginUser.UserName),
        //        new Claim(ClaimTypes.NameIdentifier, Guid.NewGuid().ToString()),
        //        new Claim(ClaimTypes.Upn, loginUser.CustomizedId)
        //    };

        //    // Add roles as multiple claims
        //    if (loginUser.UserRoles != null)
        //    {
        //        foreach (var role in loginUser.UserRoles)
        //        {
        //            claims.Add(new Claim(ClaimTypes.Role, role.RoleName));
        //        }
        //    }
        //    var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
        //    var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256Signature);
        //    var tokenDescriptor = new JwtSecurityToken(issuer, issuer, claims,
        //        expires: DateTime.Now.AddMinutes(EXPIRY_DURATION_MINUTES), signingCredentials: credentials);
        //    return new JwtSecurityTokenHandler().WriteToken(tokenDescriptor);
        //}
        public bool IsTokenValid(string token) // string key, string issuer,
        {
            var mySecret = Encoding.UTF8.GetBytes(JwtTokenConfiguration.Current.JwtKey);
            var mySecurityKey = new SymmetricSecurityKey(mySecret);
            var tokenHandler = new JwtSecurityTokenHandler();
            try
            {
                tokenHandler.ValidateToken(token,
                new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime= true,
                    ValidIssuer = metaData.Issuer,
                    ValidAudience = metaData.Audience,
                    IssuerSigningKey = mySecurityKey,
                }, out SecurityToken validatedToken);
            }
            catch
            {
                return false;
            }
            return true;
        }

        //public bool ValidateToken(string key, string issuer, string audience, string token)
        //{
        //    throw new NotImplementedException();
        //}
    }

    public class JwtMetaData
    {
        public string Issuer { get; set; }
        public string Audience { get; set; }
        public string JWtKey { get; set; }
        public double JwtExpiration { get; set; }
        public double RefreshTokenExpiration { get; set; }
        public string SecurityKey { get; set; }
    }
}
