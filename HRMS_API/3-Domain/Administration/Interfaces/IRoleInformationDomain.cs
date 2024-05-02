using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Base;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.SearchCriteria.Administration;

namespace Phoenix.Domain.Administration.Interfaces
{
    public interface IRoleInformationDomain : IBaseDomain
    {
        Task<List<RoleInformation>> GetUserRoles(long employeeSlno);
        Task<List<RoleInformation>> GetAllActiveRoles();
        Task<bool> MapRolesToUser();
        Task<List<RoleInformation>> SearchRoles(RoleInformationSearchCriteria searchCriteria);
        Task<bool> ActivateRole(long roleSlno);
        Task<bool> DeActivateRole(long roleSlno);
        Task<RoleInformation> GetRoleInformation(long roleSlno);
        Task<bool> SaveRoleInformation(RoleInformation roleInformation);
    }
}
