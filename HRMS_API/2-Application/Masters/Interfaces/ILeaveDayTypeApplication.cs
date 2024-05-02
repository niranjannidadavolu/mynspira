using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Model.Business.Masters;

namespace Phoenix.Application.Masters.Interfaces
{
    public interface ILeaveDayTypeApplication
    {
        Task<List<LeaveDayType>> GetLeaveDayTypes();
    }
}
