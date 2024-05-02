using Phoenix.Model.Business;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Interfaces
{
    public interface IDesignationInformationDomain
    {
        Task<List<DesignationInformation>> GetDesignationInformations();
        Task<List<DesignationInformation>> GetDesignationInformationsByDepartment(int departmentSlno);
    }
}
