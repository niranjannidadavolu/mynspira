using Phoenix.Model.Business.Districts;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Districts.Interfaces
{
    public  interface IDistrictsDomain
    {
        Task<List<DistrictDetails>> GetDistrictDetails(int stateSlNo);
    }
}
