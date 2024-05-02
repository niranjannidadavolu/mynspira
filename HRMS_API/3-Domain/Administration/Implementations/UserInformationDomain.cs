
using System.Threading.Tasks;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Administration;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.CrossCutting.Utils.Token;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.Administration.Implementations
{
    public class UserInformationDomain : BaseDomain, IUserInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly ICryptography cryptography;
        private readonly IDistributedCache redisCache;
        private readonly IJwtAuthManager jwtAuthManager;

        public UserInformationDomain(IConfiguration configuration, ICryptography cryptography, IDistributedCache redisCache, IJwtAuthManager jwtAuthManager)
            : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.cryptography = cryptography;
            this.redisCache = redisCache;
            this.jwtAuthManager = jwtAuthManager;
        }

        public async Task<bool> ActivateUser(long employeeSlno)
        {
            bool isUserActivated = false;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                isUserActivated = await dashboardRepository.ActivateUser(employeeSlno);
            }
            return isUserActivated;
        }

        public async Task<bool> ChangePassword(UserInformation userInformation)
        {
            bool isPasswordChanged = false;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                isPasswordChanged = await dashboardRepository.ChangePassword(userInformation);
            }
            return isPasswordChanged;
        }

        public async Task<bool> DeActivateUser(long employeeSlno)
        {
            bool isUserDeActivated = false;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                isUserDeActivated = await dashboardRepository.DeActivateUser(employeeSlno);
            }
            return isUserDeActivated;
        }

        public async Task<List<RoleInformation>> GetMappedRoles(int employeeSlno)
        {
            List<RoleInformation> mappedRoles = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                mappedRoles = await dashboardRepository.GetMappedRoles(employeeSlno);
            }
            return mappedRoles;
        }
        public async Task<List<BranchInformation>> GetUserBranchesFromNerp(int userSlno)
        {
            List<BranchInformation> mappedRoles = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                mappedRoles = await dashboardRepository.GetUserBranchesFromNerp(userSlno);
            }
            return mappedRoles;
        }


        public async Task<OtpData> GetOtp(string userName,bool isSignUp)
        {
            OtpData isOtpGenerated = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                isOtpGenerated = await dashboardRepository.GetOtp(userName,isSignUp);
            }
            return isOtpGenerated;
        }

        public async Task<bool> SaveOrUpdateUser(UserInformation userInformation)
        {
            bool isUserSaved = false;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                isUserSaved = await dashboardRepository.SaveOrUpdateUser(userInformation);
            }
            return isUserSaved;
        }

        public async Task<OtpData> SignUp(string userName)
        {
            OtpData isOtpGenerated = null;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                isOtpGenerated = await dashboardRepository.SignUp(userName);
            }
            return isOtpGenerated;
        }

        public async Task<bool> ValidateOtp(string userName, string otpValue)
        {
            bool isOtpGenerated = false;
            using (UserInformationRepository dashboardRepository = new(configuration, cryptography, redisCache, jwtAuthManager))
            {
                isOtpGenerated = await dashboardRepository.ValidateOtp(userName, otpValue);
            }
            return isOtpGenerated;
        }
    }
}
