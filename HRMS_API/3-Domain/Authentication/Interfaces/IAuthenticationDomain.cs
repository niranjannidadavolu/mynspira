using System.Threading.Tasks;
using Phoenix.Domain.Base;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Employee;


namespace Phoenix.Domain.Authentication.Interfaces
{
    public interface IAuthenticationDomain : IBaseDomain
    {
        Task<UserInformation> AuthenticateUser(LoginInformation loginInformation);
        Task<bool> FetchEqualVerificationDetials(string token);
        Task<EmployeeProfile> GetEmployeeProfile(int employeeSlno);
        Task<UserInformation> ValidateAndAuthenticateUser(string userName);
        Task<UserInformation> RefreshTokenValidateAndAuthenticateUser(UserInformation userInformationreq);
        Task<UserInformation> AuthenticateUserForNerp(LoginInformation loginInformation);
        Task<UserInformation> ValidateUser(LoginInformation loginInformation);
        Task<UserInformation> AuthenticateUserForEpic(LoginInformation loginInformation);
    }
}
