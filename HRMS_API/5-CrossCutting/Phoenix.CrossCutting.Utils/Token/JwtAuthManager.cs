using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Helper;

namespace Phoenix.CrossCutting.Utils.Token
{

    public class JwtAuthManager : IJwtAuthManager
    {
        public IImmutableDictionary<string, RefreshToken> UsersRefreshTokensReadOnlyDictionary => this.usersRefreshTokens.ToImmutableDictionary();

        private readonly ConcurrentDictionary<string, RefreshToken> usersRefreshTokens;  // can store in a database or a distributed cache
        private readonly byte[] secret;

        public JwtAuthManager()
        {
            this.usersRefreshTokens = new ConcurrentDictionary<string, RefreshToken>();
            this.secret = Encoding.ASCII.GetBytes(JwtTokenConfiguration.Current.JwtKey);
        }

        // optional: clean up expired refresh tokens
        public void RemoveExpiredRefreshTokens(DateTime now)
        {
            var expiredTokens = this.usersRefreshTokens.Where(x => x.Value.ExpireAt < now).ToList();
            foreach (var expiredToken in expiredTokens)
            {
                this.usersRefreshTokens.TryRemove(expiredToken.Key, out _);
            }
        }

        // can be more specific to ip, user agent, device name, etc.
        public void RemoveRefreshTokenByUserName(string userName)
        {
            var refreshTokens = this.usersRefreshTokens.Where(x => x.Value.UserName == userName).ToList();
            foreach (var refreshToken in refreshTokens)
            {
                this.usersRefreshTokens.TryRemove(refreshToken.Key, out _);
            }
        }

        public JwtAuthResult GenerateTokens(string username, Claim[] claims, DateTime now)
        {
            var shouldAddAudienceClaim = string.IsNullOrWhiteSpace(claims?.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Aud)?.Value);
            var jwtToken = new JwtSecurityToken(
                JwtTokenConfiguration.Current.JwtIssuer,
                shouldAddAudienceClaim ? JwtTokenConfiguration.Current.Jwtaudience : string.Empty,
                claims,
                expires: now.AddHours(JwtTokenConfiguration.Current.JwtExpire.ToDoubleOrDefault()),
                signingCredentials: new SigningCredentials(new SymmetricSecurityKey(this.secret), SecurityAlgorithms.HmacSha256Signature));
            var accessToken = new JwtSecurityTokenHandler().WriteToken(jwtToken);

            var refreshToken = new RefreshToken
            {
                UserName = username,
                TokenString = GenerateRefreshTokenString(),
                ExpireAt = now.AddHours(JwtTokenConfiguration.Current.refreshTokenExpiration.ToDoubleOrDefault()),
            };
            this.usersRefreshTokens.AddOrUpdate(refreshToken.TokenString, refreshToken, (_, _) => refreshToken);

            return new JwtAuthResult
            {
                AccessToken = accessToken,
                RefreshToken = refreshToken,
            };
        }

        public JwtAuthResult Refresh(UserInformation userInformation)
        {
            var principal2 = this.GetPrincipalFromExpiredToken(userInformation.Token);
             var (principal, jwtToken) = this.DecodeJwtToken(userInformation.Token);
            //if (jwtToken == null || !jwtToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256Signature))
            //{
            //    throw new SecurityTokenException("Invalid token");
            //}

            var userName = principal.Identity?.Name;
            if (!this.usersRefreshTokens.TryGetValue(userInformation.RefreshToken.TokenString, out var existingRefreshToken))
            {
                throw new SecurityTokenException("Invalid token");
            }
            if (existingRefreshToken.UserName != userName || existingRefreshToken.ExpireAt < DateTime.Now)
            {
                throw new SecurityTokenException("Invalid token");
            }

            return this.GenerateToken(userInformation); // need to recover the original claims
        }
        public ClaimsPrincipal GetPrincipalFromExpiredToken(string token)
        {
            var mySecret = Encoding.UTF8.GetBytes(JwtTokenConfiguration.Current.JwtKey);
            var mySecurityKey = new SymmetricSecurityKey(mySecret);
            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidIssuer = JwtTokenConfiguration.Current.JwtIssuer,
                ValidAudience = JwtTokenConfiguration.Current.Jwtaudience,
                IssuerSigningKey = mySecurityKey,
            };
            var tokenHandler = new JwtSecurityTokenHandler();
            SecurityToken securityToken;
            var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out securityToken);
            var jwtSecurityToken = securityToken as JwtSecurityToken;
            //if (jwtSecurityToken == null || !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
            //    throw new SecurityTokenException("Invalid token");
            return principal;
        }
        public (ClaimsPrincipal, JwtSecurityToken) DecodeJwtToken(string token)
        {
            if (string.IsNullOrWhiteSpace(token))
            {
                throw new SecurityTokenException("Invalid token");
            }
            var mySecret = Encoding.UTF8.GetBytes(JwtTokenConfiguration.Current.JwtKey);
            var mySecurityKey = new SymmetricSecurityKey(mySecret);
            var principal = new JwtSecurityTokenHandler()
                .ValidateToken(token,
                    new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidIssuer = JwtTokenConfiguration.Current.JwtIssuer,
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = mySecurityKey,
                        ValidAudience = JwtTokenConfiguration.Current.Jwtaudience,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ClockSkew = TimeSpan.FromMinutes(1),
                    },
                    out SecurityToken validatedToken);
            return (principal, validatedToken as JwtSecurityToken);
        }

        private static string GenerateRefreshTokenString()
        {
            var randomNumber = new byte[32];
            using var randomNumberGenerator = RandomNumberGenerator.Create();
            randomNumberGenerator.GetBytes(randomNumber);
            return Convert.ToBase64String(randomNumber);
        }

        public JwtAuthResult GenerateToken(UserInformation user)
        {
            Claim[] generateClaims = GenerateClaims(user);
            var shouldAddAudienceClaim = string.IsNullOrWhiteSpace(generateClaims?.FirstOrDefault(x => x.Type == JwtRegisteredClaimNames.Aud)?.Value);
            var jwtToken = new JwtSecurityToken(
               JwtTokenConfiguration.Current.JwtIssuer,
                shouldAddAudienceClaim ? JwtTokenConfiguration.Current.Jwtaudience : string.Empty,
                generateClaims,
                expires: DateTime.Now.AddHours(JwtTokenConfiguration.Current.JwtExpire.ToDoubleOrDefault()),
                signingCredentials: new SigningCredentials(new SymmetricSecurityKey(this.secret), SecurityAlgorithms.HmacSha256Signature));
            var accessToken = new JwtSecurityTokenHandler().WriteToken(jwtToken);

            var refreshToken = new RefreshToken
            {
                UserName = user.CustomizedId,
                TokenString = GenerateRefreshTokenString(),
                ExpireAt = DateTime.Now.AddHours(JwtTokenConfiguration.Current.refreshTokenExpiration.ToDoubleOrDefault()),
            };
            this.usersRefreshTokens.AddOrUpdate(refreshToken.TokenString, refreshToken, (_, _) => refreshToken);

            return new JwtAuthResult
            {
                AccessToken = accessToken,
                RefreshToken = refreshToken,
            };
        }
        private Claim[] GenerateClaims(UserInformation loginUser)
        {
            Claim[] generatedClaims = null;
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
            generatedClaims = claims.ToArray();
            return generatedClaims;
        }
        public bool ValidateToken(string token) // string key, string issuer,
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
                    ValidateLifetime = true,
                    ValidIssuer = JwtTokenConfiguration.Current.JwtIssuer,
                    ValidAudience = JwtTokenConfiguration.Current.Jwtaudience,
                    IssuerSigningKey = mySecurityKey,
                    

            }, out SecurityToken validatedToken);
                return true;

            }
            catch
            {
                return false;
            }
        }
    }
}
