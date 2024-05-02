using Phoenix.Application.Mandals.Interfaces;
using Phoenix.Domain.Mandals.Interfaces;
using Phoenix.Model.Business.Mandals;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Mandals.Implementations
{
    public class MandalsApplication : IMandalsApplication
    {
        private readonly IMandalsDomain mandalsDomain;
        public MandalsApplication(IMandalsDomain mandalsDomain)
        {
            this.mandalsDomain = mandalsDomain;
        }

        public async Task<List<MandalDetails>> GetMandalDetails(int districtSlNo)
        {
            List<MandalDetails> mandalDetails = await mandalsDomain.GetMandalDetails(districtSlNo);
            return mandalDetails;
        }
    }
}
