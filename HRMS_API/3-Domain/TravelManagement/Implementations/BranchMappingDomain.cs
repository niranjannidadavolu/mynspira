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
    public class BranchMappingDomain : BaseDomain, IBranchMappingDomain
    {
        private readonly IConfiguration configuration;
        public BranchMappingDomain(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LocationMappingDetail>> LoadAllBranchMappings()
        {
            List<LocationMappingDetail> travelLocationDetails = null;
            using (BranchMappingRepository repository = new BranchMappingRepository(this.configuration))
            {
                travelLocationDetails = await repository.LoadAllBranchMappings();
            }
            return travelLocationDetails;
        }

        public async Task<bool> SaveBranchMappings(List<LocationMappingDetail> locationDetails)
        {
            bool isSaved = false;
            using (BranchMappingRepository repository = new BranchMappingRepository(this.configuration))
            {
                isSaved = await repository.SaveBranchMappings(locationDetails);
            }
            return isSaved;
        }

        public async Task<List<LocationMappingDetail>> GetMappedLocationsByLocationId(int fromLocationId)
        {
            List<LocationMappingDetail> travelLocationDetails = null;
            using (BranchMappingRepository repository = new BranchMappingRepository(this.configuration))
            {
                travelLocationDetails = await repository.GetMappedLocationsByLocationId(fromLocationId);
            }
            return travelLocationDetails;
        }
    }
}
