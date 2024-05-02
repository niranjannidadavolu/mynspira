using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Base;
using Phoenix.Application.TMS.Interfaces;
using Phoenix.Application.TravelManagement.Interfaces;
using Phoenix.Domain.TMS.Interfaces;
using Phoenix.Domain.TravelManagement.Implementations;
using Phoenix.Domain.TravelManagement.Interfaces;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Application.TravelManagement.Implementations
{
    public class AssignBranchApplication : BaseApplication, IAssignBranchApplication
    {
        private readonly IAssignBranchDomain employeeBranchMapping;
        private readonly IConfiguration configuration;
        public AssignBranchApplication(IAssignBranchDomain employeeBranchMapping, IConfiguration configuration) : base(configuration)
        {
            this.employeeBranchMapping = employeeBranchMapping;
            this.configuration = configuration;
        }


        public async Task<List<LocationMappingDetail>> GetEmployeeBranchMappings(int employeeId)
        {
            List<LocationMappingDetail> travelLocations = null;
            travelLocations = await employeeBranchMapping.GetEmployeeBranchMappings(employeeId);
            return travelLocations;
        }

        public async Task<EmployeeBranchMapping> GetAllEmployeeBranchMappings()
        {
            EmployeeBranchMapping assignBranch = null;
            assignBranch = await employeeBranchMapping.GetAllEmployeeBranchMappings();
            return assignBranch;
        }

        public async Task<bool> MapSelectedBranchesToEmployee(AssignBranch assignBranches)
        {
            bool isSaved = false;
            isSaved = await employeeBranchMapping.MapSelectedBranchesToEmployee(assignBranches);
            return isSaved;
        }
    }
}
