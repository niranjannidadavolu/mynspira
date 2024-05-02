using Phoenix.Model.Business.Mandals;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Mandals.Interfaces
{
    public interface IMandalsDomain
    {
        Task<List<MandalDetails>> GetMandalDetails(int districtSlNo);
    }
}
