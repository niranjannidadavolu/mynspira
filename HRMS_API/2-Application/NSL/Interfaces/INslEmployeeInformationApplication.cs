using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.NSL;

namespace Phoenix.Application.NSL.Interfaces
{
    public interface INslEmployeeProfileApplication
    {
        Task<PagedResultSet<EmployeeProfileData>> GetAllEmployeeProfiles(EmployeeProfileSearchCriteria searchCriteria);
        Task<EmployeeProfileData> GetEmployeeProfile(string employeeId);
    }
}
