using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Domain.TravelManagement.Interfaces
{
    public interface IBranchMappingDomain
    {
        Task<List<LocationMappingDetail>> LoadAllBranchMappings();
        Task<bool> SaveBranchMappings(List<LocationMappingDetail> locationDetails);
        Task<List<LocationMappingDetail>> GetMappedLocationsByLocationId(int fromLocationId);
    }
}
