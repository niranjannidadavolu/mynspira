using Phoenix.Model.Business.Masters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Masters.Interfaces
{
    public interface IDepartmentInformationApplication
    {
        Task<List<DepartmentInformation>> GetDepartmentInformations();
    }
}
