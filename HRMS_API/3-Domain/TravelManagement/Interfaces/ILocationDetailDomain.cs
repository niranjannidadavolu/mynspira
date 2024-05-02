using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Domain.TravelManagement.Interfaces
{
    public interface ILocationDetailDomain
    {
        Task<PagedResultSet<LocationDetail>> GetTravelLocationDetails(TravelLocationSearchCriteria searchCriteria);
        Task<bool> SaveLocationDetails(LocationDetail locationDetail);
        Task<List<LocationDetail>> GetTravelLocations();
    }
}
