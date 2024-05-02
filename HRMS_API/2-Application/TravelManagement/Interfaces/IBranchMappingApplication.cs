using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Application.TravelManagement.Interfaces
{
    public interface IBranchMappingApplication
    {
        Task<bool> SaveBranchMappings(List<LocationMappingDetail> locationDetail);
        Task<List<LocationMappingDetail>> LoadAllBranchMappings();
        Task<List<LocationMappingDetail>> GetMappedLocationsByLocationId(int fromLocationId);
    }
}
