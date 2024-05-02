
using System.Threading.Tasks;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.Application.Administration.Interfaces;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.Domain.Base;
using Phoenix.CrossCutting.Utils.Token;

namespace Phoenix.Application.Administration.Implementations
{
    public class UserInformationApplication : BaseDomain, IUserInformationApplication
    {
        private readonly IUserInformationDomain userInformationDomain;
        private readonly IConfiguration configuration;
        private readonly ICryptography cryptography;
        private readonly IDistributedCache redisCache;
        private readonly IJwtAuthManager tokenService;

        public UserInformationApplication(IUserInformationDomain userInformationDomain, IConfiguration configuration, ICryptography cryptography, IDistributedCache redisCache, IJwtAuthManager tokenService)
            : base(configuration, redisCache)
        {
            this.userInformationDomain = userInformationDomain;
            this.configuration = configuration;
            this.cryptography = cryptography;
            this.redisCache = redisCache;
            this.tokenService = tokenService;
        }

        public async Task<bool> ActivateUser(long employeeSlno)
        {
            bool isUserActivated = await userInformationDomain.ActivateUser(employeeSlno);
            return isUserActivated;
        }

        public async Task<bool> ChangePassword(UserInformation userInformation)
        {
            bool isPasswordChanged = false;
            isPasswordChanged = await userInformationDomain.ChangePassword(userInformation);
            return isPasswordChanged;
        }

        public async Task<bool> DeActivateUser(long employeeSlno)
        {
            bool isUserDeactivated = await userInformationDomain.DeActivateUser(employeeSlno);
            return isUserDeactivated;
        }

        public async Task<List<RoleInformation>> GetMappedRoles(int employeeSlno)
        {
            List<RoleInformation> mappedRoles = await userInformationDomain.GetMappedRoles(employeeSlno);
            return mappedRoles;
        }
        public async Task<List<BranchInformation>> GetUserBranchesFromNerp(int userSlno)
        {
            List<BranchInformation> mappedBranches = await userInformationDomain.GetUserBranchesFromNerp(userSlno);
            return mappedBranches;
        }
        public async Task<OtpData> GetOtp(string userName, bool isSignUp)
        {
            OtpData isOtpGenerated = null;
            isOtpGenerated = await userInformationDomain.GetOtp(userName, isSignUp);
            return isOtpGenerated;
        }

        public async Task<bool> SaveOrUpdateUser(UserInformation userInformation)
        {
            bool isSaved = await userInformationDomain.SaveOrUpdateUser(userInformation);
            return isSaved;
        }

        public async Task<OtpData> SignUp(string userName)
        {
            OtpData isOtpGenerated = null;
            isOtpGenerated = await userInformationDomain.SignUp(userName);
            return isOtpGenerated;
        }

        public async Task<bool> ValidateOtp(string userName, string otpValue)
        {
            bool isOtpGenerated = false;
            isOtpGenerated = await userInformationDomain.ValidateOtp(userName, otpValue);
            return isOtpGenerated;
        }
    }
}
