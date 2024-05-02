using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Interfaces
{
    public interface IDepartmentInformationDomain
    {
        Task<List<DepartmentInformation>> GetDepartmentInformations();
    }
}
