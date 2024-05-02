using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Masters.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Application.Masters.Implementations
{
    public class LeaveDayTypeApplication : ILeaveDayTypeApplication
    {
        private readonly ILeaveDayTypeDomain leaveDayTypeDomain;
        public LeaveDayTypeApplication(ILeaveDayTypeDomain leaveDayTypeDomain)
        {
            this.leaveDayTypeDomain = leaveDayTypeDomain;
        }

        public async Task<List<LeaveDayType>> GetLeaveDayTypes()
        {
            List<LeaveDayType> leaveDayType = await leaveDayTypeDomain.GetLeaveDayTypes();
            return leaveDayType;
        }
    }
}