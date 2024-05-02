using Phoenix.Application.Masters.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Masters.Implementations
{
    public class DepartmentInformationApplication : IDepartmentInformationApplication
    {
        private readonly IDepartmentInformationDomain departmentInformationDomain;
        public DepartmentInformationApplication(IDepartmentInformationDomain departmentInformationDomain)
        {
            this.departmentInformationDomain = departmentInformationDomain;
        }

        public async Task<List<DepartmentInformation>> GetDepartmentInformations()
        {
            List<DepartmentInformation> departmentInformation = await departmentInformationDomain.GetDepartmentInformations();
            return departmentInformation;
        }

    }
}