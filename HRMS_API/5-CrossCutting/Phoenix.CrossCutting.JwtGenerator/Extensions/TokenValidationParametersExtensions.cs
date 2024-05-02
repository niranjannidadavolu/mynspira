using System;
using Microsoft.IdentityModel.Tokens;
using Phoenix.CrossCutting.JwtGenerator.Types;

namespace Phoenix.CrossCutting.JwtGenerator.Extensions
{
    public static class TokenValidationParametersExtensions
    {
        public static TokenValidationParameters ToTokenValidationParams(
            this TokenOptions tokenOptions) =>
            new TokenValidationParameters
            {
                ClockSkew = TimeSpan.Zero,

                ValidateAudience = true,
                ValidAudience = tokenOptions.Audience,

                ValidateIssuer = true,
                ValidIssuer = tokenOptions.Issuer,

                IssuerSigningKey = tokenOptions.SigningKey,
                ValidateIssuerSigningKey = true,

                RequireExpirationTime = true,
                ValidateLifetime = true
            };
    }
}