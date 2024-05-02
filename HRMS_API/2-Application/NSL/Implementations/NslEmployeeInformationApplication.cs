using Phoenix.Application.NSL.Interfaces;
using Phoenix.Domain.NSL.Interfaces;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.NSL;

namespace Phoenix.Application.NSL.Implementations
{
    public class NslEmployeeProfileApplication : INslEmployeeProfileApplication
    {
        private readonly INslEmployeeProfileDomain NslEmployeeProfileDomain;
        public NslEmployeeProfileApplication(INslEmployeeProfileDomain NslEmployeeProfileDomain)
        {
            this.NslEmployeeProfileDomain = NslEmployeeProfileDomain;
        }

        public async Task<PagedResultSet<EmployeeProfileData>> GetAllEmployeeProfiles(EmployeeProfileSearchCriteria searchCriteria)
        {
            PagedResultSet<EmployeeProfileData> employeeProfiles = await this.NslEmployeeProfileDomain.GetAllEmployeeProfiles(searchCriteria);
            return employeeProfiles;
        }

        public async Task<EmployeeProfileData> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfileData employeeProfile = await this.NslEmployeeProfileDomain.GetEmployeeProfile(employeeId);
            return employeeProfile;
        }
    }
}