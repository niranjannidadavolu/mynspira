using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Mandals;
using Phoenix.Domain.Mandals.Interfaces;
using Phoenix.Model.Business.Mandals;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Mandals.Implementations
{
    public class MandalsDomain: IMandalsDomain
    {
        private readonly IConfiguration configuration;
        public MandalsDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<MandalDetails>> GetMandalDetails(int districtSlNo)
        {
            using (MandalsRespository mandalsRespository = new(configuration))
            {
                return await mandalsRespository.GetMandalDetails(districtSlNo);
            }
        }
    }
}
