using Phoenix.Application.States.Interfaces;
using Phoenix.Domain.States.Interfaces;
using Phoenix.Model.Business.States;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.States.Implementations
{
    public class StatesApplication: IStatesApplication
    {
        private readonly IStatesDomain statesDomain;
        public StatesApplication(IStatesDomain statesDomain)
        {
            this.statesDomain = statesDomain;
        }

        public async Task<List<StatesDetails>> GetStatesDetails()
        {
            List<StatesDetails> statesDetails = await statesDomain.GetStatesDetails();
            return statesDetails;
        }
    }
}
