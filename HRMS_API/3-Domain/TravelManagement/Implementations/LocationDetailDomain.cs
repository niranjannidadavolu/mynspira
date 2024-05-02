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
    public class LocationDetailDomain : BaseDomain, ILocationDetailDomain
    {
        private readonly IConfiguration configuration;
        public LocationDetailDomain(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<PagedResultSet<LocationDetail>> GetTravelLocationDetails(TravelLocationSearchCriteria searchCriteria)
        {
            PagedResultSet<LocationDetail> travelLocationDetails = null;
            using (LocationdetailRepository repository = new LocationdetailRepository(this.configuration))
            {
                travelLocationDetails = await repository.GetTravelLocationDetails(searchCriteria);
            }
            return travelLocationDetails;
        }

        public async Task<bool> SaveLocationDetails(LocationDetail locationDetail)
        {
            bool isSaved = false;
            using (LocationdetailRepository repository = new LocationdetailRepository(this.configuration))
            {
                isSaved = await repository.SaveLocationDetails(locationDetail);
            }
            return isSaved;
        }

        public async Task<List<LocationDetail>> GetTravelLocations()
        {
            List<LocationDetail> travelLocationDetails = null;
            using (LocationdetailRepository repository = new LocationdetailRepository(this.configuration))
            {
                travelLocationDetails = await repository.GetTravelLocations();
            }
            return travelLocationDetails;
        }
    }
}
