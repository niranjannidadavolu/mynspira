using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Masters;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Masters.Interfaces;

namespace Phoenix.Domain.Masters.Implementations
{
    public class LeaveDayTypeDomain : ILeaveDayTypeDomain
    {
        private readonly IConfiguration configuration;
        public LeaveDayTypeDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<LeaveDayType>> GetLeaveDayTypes()
        {
            List<LeaveDayType> leaveDayType = null;
            using (LeaveDayTypeRepository leaveDayTypeRepository = new(configuration))
            {
                leaveDayType = await leaveDayTypeRepository.GetLeaveDayTypes();
            }
            return leaveDayType;
        }
    }
}
