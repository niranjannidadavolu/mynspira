using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Base;
using Phoenix.Application.TMS.Interfaces;
using Phoenix.Application.TravelManagement.Interfaces;
using Phoenix.Domain.TMS.Interfaces;
using Phoenix.Domain.TravelManagement.Interfaces;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Application.TravelManagement.Implementations
{
    public class LocationDetailApplication : BaseApplication, ILocationDetailApplication
    {
        private readonly ILocationDetailDomain locationDetailDomain;
        private readonly IConfiguration _configuration;
        public LocationDetailApplication(ILocationDetailDomain locationDetailDomain, IConfiguration configuration) : base(configuration)
        {
            this.locationDetailDomain = locationDetailDomain;
            this._configuration = configuration;
        }


        public async Task<PagedResultSet<LocationDetail>> GetTravelLocationDetails(TravelLocationSearchCriteria searchCriteria)
        {
            PagedResultSet<LocationDetail> travelLocations = null;
            travelLocations = await locationDetailDomain.GetTravelLocationDetails(searchCriteria);
            return travelLocations;
        }

        public async Task<bool> SaveLocationDetails(LocationDetail locationDetail)
        {
            bool isSaved = false;
            isSaved = await locationDetailDomain.SaveLocationDetails(locationDetail);
            return isSaved;
        }

        public async Task<List<LocationDetail>> GetTravelLocations()
        {
            List<LocationDetail> travelLocations = null;
            travelLocations = await locationDetailDomain.GetTravelLocations();
            return travelLocations;
        }
    }
}
