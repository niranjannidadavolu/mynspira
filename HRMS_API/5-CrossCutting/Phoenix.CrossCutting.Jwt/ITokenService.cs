using Phoenix.Model.Business.Administration;

namespace Phoenix.CrossCutting.Jwt
{
    public interface ITokenService
    {
        string BuildToken(JwtMetaData metaData, UserInformation loginUser);
       // string BuildToken(string key, string issuer, UserInformation user);
       // bool ValidateToken(string key, string issuer, string audience, string token);
        bool IsTokenValid(JwtMetaData metaData, string token);
    }
}