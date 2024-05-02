using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.States;
using Phoenix.Domain.States.Interfaces;
using Phoenix.Model.Business.States;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.States.Implementations
{
    public class StatesDomain:IStatesDomain
    {
        private readonly IConfiguration configuration;
        public StatesDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<StatesDetails>> GetStatesDetails()
        {
            using (StatesRepository statesRepository = new(configuration))
            {
                return await statesRepository.GetStatesDetails();
            }
        }
    }
}
