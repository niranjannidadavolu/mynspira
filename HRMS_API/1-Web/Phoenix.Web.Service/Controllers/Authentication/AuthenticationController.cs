using System.Linq;
using Phoenix.Model.Business.Administration;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;

using System.Threading.Tasks;
using Phoenix.Application.Authentication.Interfaces;
using Phoenix.CrossCutting.Extension.TArray.System.Array;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.Model.Business.Employee;
using Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Authentication
{
    [Route("api/[Controller]/")]
    public class AuthenticationController : BaseController
    {
        private readonly IAuthenticationApplication authenticationApplication;
        private readonly ICryptography cryptography;
        private readonly IDistributedCache redisCache;


        public AuthenticationController(IAuthenticationApplication authenticationApplication, ICryptography cryptography, IDistributedCache redisCache)
            : base(redisCache)
        {
            this.authenticationApplication = authenticationApplication;
            this.redisCache = redisCache;
            this.cryptography = cryptography;
        }

        [HttpPost]
        [Route("AuthenticateUser")]
        public async Task<UserInformation> AuthenticateUser([FromBody] LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationApplication.AuthenticateUser(loginInformation);
            if (userInformation != null)
            {
                userInformation.CanApplyLeave = ApplicationSettings.Current.ApplyLeaveVisibility.Any(x=>x == userInformation.EmployeeSlno);
            }
            return userInformation;
        }

        [HttpGet]
        [Route("FetchEqualVerificationDetials")]
        public async Task<bool> FetchEqualVerificationDetials(string idempotencyId)
        {
            bool verified = await authenticationApplication.FetchEqualVerificationDetials(idempotencyId);
            return verified;
        }

        [HttpPost]
        [Route("AuthenticateUserForNerp")]
        public async Task<UserInformation> AuthenticateUserForNerp([FromBody] LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationApplication.AuthenticateUserForNerp(loginInformation);
            return userInformation;
        }

        [HttpPost]
        [Route("AuthenticateUserForEpic")]
        public async Task<UserInformation> AuthenticateUserForEpic([FromBody] LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationApplication.AuthenticateUserForEpic(loginInformation);
            return userInformation;
        }

        [HttpPost]
        [Route("ValidateUser")]
        public async Task<UserInformation> ValidateUser([FromBody] LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationApplication.ValidateUser(loginInformation);
            return userInformation;
        }


        [HttpGet]
        [Route("ValidateAndAuthenticateUser")]
        public async Task<UserInformation> ValidateAndAuthenticateUser(string userName)
        {
            userName = userName.Replace(" ", "+");
            string decryptedUsername = AES.Decrypt(userName, NConnectSettings.Current.SecurityKey, NConnectSettings.Current.SecuritySalt);
            UserInformation userInformation = new UserInformation();
            userInformation.UserName = decryptedUsername;
            userInformation = await authenticationApplication.ValidateAndAuthenticateUser(decryptedUsername);
            return userInformation;
        }

        [HttpPost]
        [Route("AuthenticateRefreshToken")]
        public async Task<UserInformation> RefreshTokenValidateAndAuthenticateUser([FromBody] UserInformation userInformationreq)
        {
            UserInformation userInformation = new UserInformation();
            userInformation = await authenticationApplication.RefreshTokenValidateAndAuthenticateUser(userInformationreq);
            return userInformation;
        }

        [HttpGet]
        [Route("EncryptUser")]
        public async Task<UserInformation> EncryptUser(string userName)
        {

            string encryptedUserName = AES.Encrypt(userName, NConnectSettings.Current.SecurityKey, NConnectSettings.Current.SecuritySalt);
            UserInformation userInformation = new UserInformation();
            userInformation.UserName = encryptedUserName;

            return userInformation;
        }
    }
}
