using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Base;
using Phoenix.Model.Business.Administration;

namespace Phoenix.Domain.Administration.Interfaces
{
    public interface ISecurityModuleDomain : IBaseDomain
    {
        Task<List<SecurityModule>> LoadRoleLevelAccessPermisssions();

        Task<List<SecurityModule>> LoadMappedPermissions(int roleId);

        Task<bool> SavePermissions(List<SecurityModule> permissions, int roleId);

    }
}
