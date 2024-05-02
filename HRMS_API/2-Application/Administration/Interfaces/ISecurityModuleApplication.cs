using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Base;
using Phoenix.Model.Business.Administration;

namespace Phoenix.Application.Administration.Interfaces
{
    public interface ISecurityModuleApplication : IBaseApplication
    {
        Task<List<SecurityModule>> LoadRoleLevelAccessPermisssions();

        Task<List<SecurityModule>> LoadMappedPermissions(int roleId);

        Task<bool> SavePermissions(List<SecurityModule> permissions, int roleId);
    }
}
