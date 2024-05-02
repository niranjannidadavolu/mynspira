using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Application.TravelManagement.Interfaces
{
    public interface ILocationDetailApplication
    {
        Task<PagedResultSet<LocationDetail>> GetTravelLocationDetails(TravelLocationSearchCriteria travelLocationSearchCriteria);
        Task<bool> SaveLocationDetails(LocationDetail locationDetail);
        Task<List<LocationDetail>> GetTravelLocations();
    }
}
