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
    public class BranchMappingApplication : BaseApplication, IBranchMappingApplication
    {
        private readonly IBranchMappingDomain locationMappingDetailDomain;
        private readonly IConfiguration _configuration;
        public BranchMappingApplication(IBranchMappingDomain locationDetailDomain, IConfiguration configuration) : base(configuration)
        {
            this.locationMappingDetailDomain = locationDetailDomain;
            this._configuration = configuration;
        }


        public async Task<List<LocationMappingDetail>> LoadAllBranchMappings()
        {
            List<LocationMappingDetail> travelLocations = null;
            travelLocations = await locationMappingDetailDomain.LoadAllBranchMappings();
            return travelLocations;
        }

        public async Task<List<LocationMappingDetail>> GetMappedLocationsByLocationId(int fromLocationId)
        {
            List<LocationMappingDetail> travelLocations = null;
            travelLocations = await locationMappingDetailDomain.GetMappedLocationsByLocationId(fromLocationId);
            return travelLocations;
        }

        public async Task<bool> SaveBranchMappings(List<LocationMappingDetail> locationDetails)
        {
            bool isSaved = false;
            isSaved = await locationMappingDetailDomain.SaveBranchMappings(locationDetails);
            return isSaved;
        }
    }
}
