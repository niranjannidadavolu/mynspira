using Phoenix.Application.Districts.Interfaces;
using Phoenix.Domain.Districts.Interfaces;
using Phoenix.Model.Business.Districts;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Districts.Implementations
{
    public class DistrictsApplication: IDistrictsApplication
    {

        private readonly IDistrictsDomain districtsDomain;
        public DistrictsApplication(IDistrictsDomain districtsDomain)
        {
            this.districtsDomain = districtsDomain;
        }
        public async Task<List<DistrictDetails>> GetDistrictDetails(int stateSlNo)
        {
            List<DistrictDetails> districtDetails = await districtsDomain.GetDistrictDetails(stateSlNo);
            return districtDetails;
        }
    }
}
