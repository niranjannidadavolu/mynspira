using Phoenix.Model.Business.States;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.States.Interfaces
{
    public interface IStatesApplication
    {
        Task<List<StatesDetails>> GetStatesDetails();
    }
}
