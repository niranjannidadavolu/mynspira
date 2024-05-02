using System.Threading.Tasks;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Authentication.Interfaces;
using Phoenix.Application.Base;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.Domain.Authentication.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Employee;

namespace Phoenix.Application.Authentication.Implementations
{
    public class AuthenticationApplication : BaseApplication, IAuthenticationApplication
    {
        private readonly IAuthenticationDomain authenticationDomain;
        private readonly IConfiguration configuration;
        private readonly ICryptography cryptography;

        public AuthenticationApplication(IAuthenticationDomain authenticationDomain, IDistributedCache redisCache, IConfiguration configuration, ICryptography cryptography)
            : base(configuration, redisCache)
        {
            this.authenticationDomain = authenticationDomain;
            this.configuration = configuration;
            this.cryptography = cryptography;
        }

        public async Task<UserInformation> AuthenticateUser(LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationDomain.AuthenticateUser(loginInformation);
            return userInformation;
        }
        public async Task<bool> FetchEqualVerificationDetials(string token)
        {
            bool verified = await authenticationDomain.FetchEqualVerificationDetials(token);
            return verified;
        }
        public async Task<UserInformation> AuthenticateUserForNerp(LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationDomain.AuthenticateUserForNerp(loginInformation);
            return userInformation;
        }
        public async Task<EmployeeProfile> GetEmployeeProfile(int employeeSlno)
        {
            EmployeeProfile employeeProfile = await authenticationDomain.GetEmployeeProfile(employeeSlno);
            return employeeProfile;
        }

        public async Task<UserInformation> ValidateAndAuthenticateUser(string userName)
        {
            UserInformation userInformation = await authenticationDomain.ValidateAndAuthenticateUser(userName);
            return userInformation;
        }
        public async Task<UserInformation> RefreshTokenValidateAndAuthenticateUser(UserInformation userInformationreq)
        {
            UserInformation userInformation = await authenticationDomain.RefreshTokenValidateAndAuthenticateUser(userInformationreq);
            return userInformation;
        }

        public async Task<UserInformation> ValidateUser(LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationDomain.ValidateUser(loginInformation);
            return userInformation;
        }

        public async Task<UserInformation> AuthenticateUserForEpic(LoginInformation loginInformation)
        {
            UserInformation userInformation = await authenticationDomain.AuthenticateUserForEpic(loginInformation);
            return userInformation;
        }
    }
}
