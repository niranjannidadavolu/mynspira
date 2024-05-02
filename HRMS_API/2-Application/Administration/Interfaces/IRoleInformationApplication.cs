using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Base;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.SearchCriteria.Administration;

namespace Phoenix.Application.Administration.Interfaces
{
    public interface IRoleInformationApplication : IBaseApplication
    {
        Task<List<RoleInformation>> GetUserRoles(long employeeSlno);
        Task<List<RoleInformation>> GetAllActiveRoles();
        Task<bool> MapRolesToUser();
        Task<bool> ActivateRole(long roleSlno);
        Task<bool> DeActivateRole(long roleSlno);
        Task<List<RoleInformation>> SearchRoles(RoleInformationSearchCriteria searchCriteria);
        Task<RoleInformation> GetRoleInformation(long roleSlno);
        Task<bool> SaveRoleInformation(RoleInformation roleInformation);
    }
}
