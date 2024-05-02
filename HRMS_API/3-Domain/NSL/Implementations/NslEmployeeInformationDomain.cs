using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Employee;
using Phoenix.Domain.NSL.Interfaces;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.NSL;
using Phoenix.Model.Business.SearchCriteria.EmployeeInformation;
using System.Threading.Tasks;
using Phoenix.Database.Repository.NSL;
using Phoenix.Domain.Base;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.NSL;

namespace Phoenix.Domain.NSL.Implementations
{
    public class NslEmployeeProfileDomain : BaseDomain, INslEmployeeProfileDomain
    {

        private readonly IConfiguration configuration;
        public NslEmployeeProfileDomain(IConfiguration configuration)
            : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<PagedResultSet<EmployeeProfileData>> GetAllEmployeeProfiles(EmployeeProfileSearchCriteria  searchCriteria)
        {
            PagedResultSet<EmployeeProfileData> employeeProfiles = null;
            using (EmployeeProfileRepository repository = new EmployeeProfileRepository(configuration))
            {
                employeeProfiles = await repository.GetEmployeeProfiles(searchCriteria);
            }
            return employeeProfiles;
        }

        public async Task<EmployeeProfileData> GetEmployeeProfile(string employeeId)
        {
            EmployeeProfileData employeeProfile = null;
            using (EmployeeProfileRepository repository = new EmployeeProfileRepository(configuration))
            {
                employeeProfile = await repository.GetEmployeeProfile(employeeId);
            }
            return employeeProfile;
        }
    }
}
