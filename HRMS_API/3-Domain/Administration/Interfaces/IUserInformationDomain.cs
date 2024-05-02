
using System.Threading.Tasks;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.Administration.Interfaces
{
    public interface IUserInformationDomain : IBaseDomain
    {
        Task<bool> ChangePassword(UserInformation userInformation);
        Task<OtpData> GetOtp(string userName,bool isSignUp);
        Task<bool> ValidateOtp(string userName, string otpValue);
        Task<OtpData> SignUp(string userName);
        Task<bool> ActivateUser(long employeeSlno);
        Task<bool> DeActivateUser(long employeeSlno);
        Task<bool> SaveOrUpdateUser(UserInformation userInformation);
        Task<List<RoleInformation>> GetMappedRoles(int employeeSlno);
        Task<List<BranchInformation>> GetUserBranchesFromNerp(int userSlno);

    }
}
