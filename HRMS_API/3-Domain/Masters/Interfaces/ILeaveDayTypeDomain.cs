using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Domain.Masters.Interfaces
{
    public interface ILeaveDayTypeDomain
    {
        Task<List<LeaveDayType>> GetLeaveDayTypes();
    }
}
