using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Districts;
using Phoenix.Domain.Districts.Interfaces;
using Phoenix.Model.Business.Districts;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Districts.Implementations
{
    public class DistrictsDomain: IDistrictsDomain
    {
        private readonly IConfiguration configuration;
        public DistrictsDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<DistrictDetails>> GetDistrictDetails(int stateSlNo)
        {
            using (DistrictsRepository districtsRepository = new(configuration))
            {
                return await districtsRepository.GetDistrictDetails(stateSlNo);
            }
        }
    }
}
