using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.Model.Business.Administration;
using Phoenix.Web.Service.Base;
using Phoenix.Web.Service.Helper;

namespace Phoenix.Web.Service.Controllers.Administration
{
    [Route("api/[Controller]/")]
    public class UserInformationController : BaseController
    {
        private readonly IUserInformationApplication userInformationApplication;
        private readonly ICryptography cryptography;
        private readonly IDistributedCache redisCache;


        public UserInformationController(IUserInformationApplication userInformationApplication, ICryptography cryptography, IDistributedCache redisCache)
            : base(redisCache)
        {
            this.redisCache = redisCache;
            this.userInformationApplication = userInformationApplication;
            this.cryptography = cryptography;
        }

        [Authorize]
        [HttpPost]
        [Route("ChangePassword")]
        public async Task<bool> ChangePassword([FromBody] UserInformation userInformation)
        {
            bool isPasswordChanged = await userInformationApplication.ChangePassword(userInformation);
            return isPasswordChanged;
        }

        [HttpGet]
        [Route("GetOtp")]
        public async Task<OtpData> GetOtp(string userName,bool isSignUp)
        {
            OtpData isOtpGenerated = await userInformationApplication.GetOtp(userName,isSignUp);
            return isOtpGenerated;
        }

        [HttpGet]
        [Route("ValidateOtp")]
        public async Task<bool> ValidateOtp(string userName, string otpValue)
        {
            bool isOtpGenerated = await userInformationApplication.ValidateOtp(userName, otpValue);
            return isOtpGenerated;
        }

        [HttpPost]
        [Route("ForgotPassword")]
        public async Task<bool> ForgotPassword([FromBody] UserInformation userInformation)
        {
            bool isPasswordChanged = await userInformationApplication.ChangePassword(userInformation);
            return isPasswordChanged;
        }

        [HttpGet]
        [Route("SignUp")]
        public async Task<OtpData> SignUp(string userName)
        {
            OtpData isPasswordChanged = await userInformationApplication.SignUp(userName);
            return isPasswordChanged;
        }

        [Authorize]
        [HttpGet]
        [Route("ActivateUser")]

        public async Task<bool> ActivateUser(long employeeSlno)
        {
            bool isUserActivated = await userInformationApplication.ActivateUser(employeeSlno);
            return isUserActivated;
        }

        [Authorize]
        [HttpGet]
        [Route("DeActivateUser")]

        public async Task<bool> DeActivateUser(long employeeSlno)
        {
            bool isUserDeactivated = await userInformationApplication.DeActivateUser(employeeSlno);
            return isUserDeactivated;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveOrUpdateUser")]

        public async Task<bool> SaveOrUpdateUser([FromBody] UserInformation userInformation)
        {
            bool isSaved = await userInformationApplication.SaveOrUpdateUser(userInformation);
            return isSaved;
        }

        [Authorize]
        [HttpGet]
        [Route("GetMappedRoles")]

        public async Task<List<RoleInformation>> GetMappedRoles(int employeeSlno)
        {
            List<RoleInformation> mappedRoles = await userInformationApplication.GetMappedRoles(employeeSlno);
            return mappedRoles;
        }

        [Authorize]
        [HttpGet]
        [Route("GetUserBranchesFromNerp")]

        public async Task<List<BranchInformation>> GetUserBranchesFromNerp(int userSlno)
        {
            List<BranchInformation> mappedBranches = await userInformationApplication.GetUserBranchesFromNerp(userSlno);
            return mappedBranches;
        }


    }
}
