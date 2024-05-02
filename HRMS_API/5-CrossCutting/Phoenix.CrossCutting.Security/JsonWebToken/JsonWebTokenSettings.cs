using System;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace Phoenix.CrossCutting.Security.JsonWebToken
{
    public static class JsonWebTokenSettings
    {
        private static SecurityKey _securityKey;

        public static string Audience => nameof(Audience);

        public static DateTime Expires => DateTime.Now.AddDays(1);

        public static string Issuer => nameof(Issuer);

        public static string Key => Guid.NewGuid() + DateTime.Now.ToString();

        public static SecurityKey SecurityKey => _securityKey ?? (_securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Key)));

        public static SigningCredentials SigningCredentials => new(SecurityKey, SecurityAlgorithms.HmacSha512);
    }
}
