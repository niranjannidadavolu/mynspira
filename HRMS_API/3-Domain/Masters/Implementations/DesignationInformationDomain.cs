using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Masters;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Implementations
{
    public class DesignationInformationDomain : IDesignationInformationDomain
    {
        private readonly IConfiguration configuration;
        public DesignationInformationDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<DesignationInformation>> GetDesignationInformations()
        {
            List<DesignationInformation> designationInformation = null;
            using (DesignationInformationRepository designationInformationRepository = new DesignationInformationRepository(configuration))
            {
                designationInformation = await designationInformationRepository.GetDesignationInformations();
            }
            return designationInformation;
        }

        public async Task<List<DesignationInformation>> GetDesignationInformationsByDepartment(int departmentSlno)
        {
            List<DesignationInformation> designationInformation = null;
            using (DesignationInformationRepository designationInformationRepository = new DesignationInformationRepository(configuration))
            {
                designationInformation = await designationInformationRepository.GetDesignationInformationsByDepartment(departmentSlno);
            }
            return designationInformation;
        }
    }
}
