using Phoenix.Model.Business.States;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.States.Interfaces
{
    public  interface IStatesDomain
    {
        Task<List<StatesDetails>> GetStatesDetails();
       
    }
}

