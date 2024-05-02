using Phoenix.Application.Masters.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Masters.Implementations
{
    public class DesignationInformationApplication : IDesignationInformationApplication
    {
        private readonly IDesignationInformationDomain designationInformationDomain;
        public DesignationInformationApplication(IDesignationInformationDomain designationInformationDomain)
        {
            this.designationInformationDomain = designationInformationDomain;
        }

        public async Task<List<DesignationInformation>> GetDesignationInformations()
        {
            List<DesignationInformation> designationInformation = await designationInformationDomain.GetDesignationInformations();
            return designationInformation;
        }

        public async Task<List<DesignationInformation>> GetDesignationInformationsByDepartment(int departmentSlno)
        {
            List<DesignationInformation> designationInformation = await designationInformationDomain.GetDesignationInformationsByDepartment(departmentSlno);
            return designationInformation;
        }
    }
}