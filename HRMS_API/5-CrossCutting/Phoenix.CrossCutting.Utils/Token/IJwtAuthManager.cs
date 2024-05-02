using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Helper;
using System;
using System.Collections.Immutable;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace Phoenix.CrossCutting.Utils.Token
{
    public interface IJwtAuthManager
    {
        IImmutableDictionary<string, RefreshToken> UsersRefreshTokensReadOnlyDictionary { get; }

        JwtAuthResult GenerateTokens(string username, Claim[] claims, DateTime now);
        JwtAuthResult GenerateToken(UserInformation user);


        JwtAuthResult Refresh(UserInformation userInformation);

        void RemoveExpiredRefreshTokens(DateTime now);

        void RemoveRefreshTokenByUserName(string userName);

        (ClaimsPrincipal, JwtSecurityToken) DecodeJwtToken(string token);
        bool ValidateToken(string token);
    }
}
