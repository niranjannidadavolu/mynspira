using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Masters;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Implementations
{
    public class DepartmentInformationDomain : IDepartmentInformationDomain
    {
        private readonly IConfiguration configuration;
        public DepartmentInformationDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<DepartmentInformation>> GetDepartmentInformations()
        {
            List<DepartmentInformation> departmentInformation = null;
            using (DepartmentInformationRepository departmentInformationRepository = new DepartmentInformationRepository(configuration))
            {
                departmentInformation = await departmentInformationRepository.GetDepartmentInformations();
            }
            return departmentInformation;
        }

          
    }
}
