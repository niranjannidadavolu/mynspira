using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.TravelManagement;
using Phoenix.Domain.Base;
using Phoenix.Domain.TravelManagement.Interfaces;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Domain.TravelManagement.Implementations
{
    public class AssignBranchDomain : BaseDomain, IAssignBranchDomain
    {
        private readonly IConfiguration configuration;
        public AssignBranchDomain(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LocationMappingDetail>> GetEmployeeBranchMappings(int employeeId)
        {
            List<LocationMappingDetail> travelLocationDetails = null;
            using (EmployeeBranchMappingRepositoy repository = new EmployeeBranchMappingRepositoy(this.configuration))
            {
                travelLocationDetails = await repository.GetEmployeeBranchMappings(employeeId);
            }
            return travelLocationDetails;
        }

        public async Task<EmployeeBranchMapping> GetAllEmployeeBranchMappings()
        {
            EmployeeBranchMapping travelLocationDetails = null;
            using (EmployeeBranchMappingRepositoy repository = new EmployeeBranchMappingRepositoy(this.configuration))
            {
                travelLocationDetails = await repository.GetAllEmployeeBranchMappings();
            }
            return travelLocationDetails;
        }

        public async Task<bool> MapSelectedBranchesToEmployee(AssignBranch assignBranches)
        {
            bool isSaved;
            using (EmployeeBranchMappingRepositoy repository = new EmployeeBranchMappingRepositoy(this.configuration))
            {
                isSaved = await repository.MapSelectedBranchesToEmployee(assignBranches);
            }
            return isSaved;
        }
    }
}
