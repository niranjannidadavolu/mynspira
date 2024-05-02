using Phoenix.Model.Business.Administration;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Caching.Distributed;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Application.Base;
using Phoenix.CrossCutting.Security.Criptography;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.SearchCriteria.Administration;

namespace Phoenix.Application.Administration.Implementations
{
    public class RoleInformationApplication : BaseApplication, IRoleInformationApplication
    {
        private readonly IRoleInformationDomain roleDomain;
        private readonly IConfiguration configuration;

        private readonly ICryptography cryptography;

        public RoleInformationApplication(IRoleInformationDomain rolDomain, IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration, redisCache)
        {
            roleDomain = rolDomain;
            this.configuration = configuration;
        }

        public async Task<bool> ActivateRole(long roleSlno)
        {
            bool isRoleActivated = await roleDomain.ActivateRole(roleSlno);
            return isRoleActivated;
        }

        public async Task<bool> DeActivateRole(long roleSlno)
        {
            bool isRolesDeActivated = await roleDomain.DeActivateRole(roleSlno);
            return isRolesDeActivated;
        }

        public async Task<List<RoleInformation>> GetAllActiveRoles()
        {
            List<RoleInformation> roleInformations = await roleDomain.GetAllActiveRoles();
            return roleInformations;
        }

        public async Task<RoleInformation> GetRoleInformation(long roleSlno)
        {
            RoleInformation roleInformation = await roleDomain.GetRoleInformation(roleSlno);
            return roleInformation;
        }

        public async Task<List<RoleInformation>> GetUserRoles(long employeeSlno)
        {
            List<RoleInformation> roleInformations = await roleDomain.GetUserRoles(employeeSlno);
            return roleInformations;
        }

        public async Task<bool> MapRolesToUser()
        {
            bool isRolesMapped = await roleDomain.MapRolesToUser();
            return isRolesMapped;
        }

        public async Task<bool> SaveRoleInformation(RoleInformation roleInformation)
        {
            bool isRoleSaved = await roleDomain.SaveRoleInformation(roleInformation);
            return isRoleSaved;
        }

        public async Task<List<RoleInformation>> SearchRoles(RoleInformationSearchCriteria searchCriteria)
        {
            List<RoleInformation> roleInformations = await roleDomain.SearchRoles(searchCriteria);
            return roleInformations;
        }
    }
}
