using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class JwtTokenConfiguration
    {
        public static JwtTokenConfiguration Current;

        public JwtTokenConfiguration()
        {
            Current = this;
        }

        public string JwtKey { get; set; }
        public string JwtIssuer { get; set; }
        public string Jwtaudience { get; set; }
        public string JwtExpire { get; set; }
        public string refreshTokenExpiration { get; set; }
        public string securityKey { get; set; }
    }
}
