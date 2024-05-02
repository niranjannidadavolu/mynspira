using Phoenix.Model.Business.Mandals;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Mandals.Interfaces
{
    public interface IMandalsApplication
    {
        Task<List<MandalDetails>> GetMandalDetails(int districtSlNo);
    }
}
