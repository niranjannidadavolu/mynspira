using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using System.Threading.Tasks;
using Phoenix.Domain.Base;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.NSL;

namespace Phoenix.Domain.NSL.Interfaces
{
    public interface INslEmployeeProfileDomain : IBaseDomain
    {
        Task<PagedResultSet<EmployeeProfileData>> GetAllEmployeeProfiles(EmployeeProfileSearchCriteria searchCriteria);
        Task<EmployeeProfileData> GetEmployeeProfile(string eEmployeeId);
    }
}
