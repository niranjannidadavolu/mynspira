using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Application.TravelManagement.Interfaces
{
    public interface IAssignBranchApplication
    {
        Task<List<LocationMappingDetail>> GetEmployeeBranchMappings(int employeeId);
        Task<EmployeeBranchMapping> GetAllEmployeeBranchMappings();
        Task<bool> MapSelectedBranchesToEmployee(AssignBranch assignBranches);
    }
}
