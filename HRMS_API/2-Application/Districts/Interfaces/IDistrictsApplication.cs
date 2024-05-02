using Phoenix.Model.Business.Districts;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Districts.Interfaces
{
    public interface IDistrictsApplication
    {
        Task<List<DistrictDetails>> GetDistrictDetails(int stateSlNo);
    }
}
