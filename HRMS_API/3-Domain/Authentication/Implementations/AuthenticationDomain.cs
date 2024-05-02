using System.Threading.Tasks;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.CrossCutting.Utils.Token;
using Phoenix.Database.Repository.Administration;
using Phoenix.Domain.Authentication.Interfaces;
using Phoenix.Domain.Base;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Employee;

namespace Phoenix.Domain.Authentication.Implementations
{
    public class AuthenticationDomain : BaseDomain, IAuthenticationDomain
    {
        private readonly IConfiguration configuration;
        private readonly ICryptography cryptography;
        private readonly IDistributedCache redisCache;
        private readonly IJwtAuthManager jwtAuthManager;

        public AuthenticationDomain(IConfiguration configuration, ICryptography cryptography, IDistributedCache redisCache, IJwtAuthManager jwtAuthManager)
            : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.cryptography = cryptography;
            this.redisCache = redisCache;
            this.jwtAuthManager = jwtAuthManager;
        }

        public async Task<UserInformation> AuthenticateUser(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                userInformation = await dashboardRepository.AuthenticateUser(loginInformation);
            }
            return userInformation;
        }
        public async Task<bool> FetchEqualVerificationDetials(string token)
        {
            bool verified = false;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                verified = await dashboardRepository.FetchEqualVerificationDetials(token);
            }
            return verified;
        }

        public async Task<EmployeeProfile> GetEmployeeProfile(int employeeSlno)
        {
            EmployeeProfile employeeProfile = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))            {
                employeeProfile = await dashboardRepository.GetEmployeeProfile(employeeSlno);
            }
            return employeeProfile;
        }

        public async Task<UserInformation> ValidateAndAuthenticateUser(string userName)
        {
            UserInformation userInformation = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                userInformation = await dashboardRepository.ValidateAndAuthenticateUser(userName);
            }
            return userInformation;
        }
        public async Task<UserInformation> RefreshTokenValidateAndAuthenticateUser(UserInformation userInformationreq)
        {
            UserInformation userInformation = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                userInformation = await dashboardRepository.RefreshTokenValidateAndAuthenticateUser(userInformationreq);
            }
            return userInformation;
        }
        public async Task<UserInformation> AuthenticateUserForNerp(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                userInformation = await dashboardRepository.AuthenticateUserForNerp(loginInformation);
            }
            return userInformation;
        }

        public async Task<UserInformation> ValidateUser(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                userInformation = await dashboardRepository.ValidateUser(loginInformation);
            }
            return userInformation;
        }

        public async Task<UserInformation> AuthenticateUserForEpic(LoginInformation loginInformation)
        {
            UserInformation userInformation = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                userInformation = await dashboardRepository.AuthenticateUserForEpic(loginInformation);
            }
            return userInformation;
        }
    }
}
