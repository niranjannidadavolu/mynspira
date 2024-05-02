using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Administration;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;

using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Base;
using Phoenix.Model.Business.SearchCriteria.Administration;

namespace Phoenix.Domain.Administration.Implementations
{
    public class RoleInformationDomain : BaseDomain, IRoleInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public RoleInformationDomain(IConfiguration configuration, IDistributedCache redisCache ) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<bool> ActivateRole(long roleSlno)
        {
            bool isRoleActivated = false;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                isRoleActivated = await roleInformationRepository.ActivateRole(roleSlno);
            }
            return isRoleActivated;
        }

        public async Task<bool> DeActivateRole(long roleSlno)
        {
            bool isRoleDeActivated = false;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                isRoleDeActivated = await roleInformationRepository.DeActivateRole(roleSlno);
            }
            return isRoleDeActivated;
        }

        public async Task<List<RoleInformation>> GetAllActiveRoles()
        {
            List<RoleInformation> roleInformations = null;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                roleInformations = await roleInformationRepository.GetAllActiveRoles();
            }
            return roleInformations;
        }

        public async Task<RoleInformation> GetRoleInformation(long roleSlno)
        {
            RoleInformation roleInformation = null;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                roleInformation = await roleInformationRepository.GetRoleInformation(roleSlno);
            }
            return roleInformation;
        }

        public async Task<List<RoleInformation>> GetUserRoles(long employeeSlno)
        {
            List<RoleInformation> roleInformations = null;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                roleInformations = await roleInformationRepository.GetUserRoles(employeeSlno);
            }
            return roleInformations;
        }

        public async Task<bool> MapRolesToUser()
        {
            bool isRolesMapped = false;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                isRolesMapped = await roleInformationRepository.MapRolesToUser();
            }
            return isRolesMapped;
        }

        public async Task<bool> SaveRoleInformation(RoleInformation roleInformation)
        {
            bool isRoleSaved = false;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                isRoleSaved = await roleInformationRepository.SaveRoleInformation(roleInformation);
            }
            return isRoleSaved;
        }

        public async Task<List<RoleInformation>> SearchRoles(RoleInformationSearchCriteria searchCriteria)
        {
            List<RoleInformation> roleInformations = null;
            using (RoleInformationRepository roleInformationRepository = new(configuration, redisCache))
            {
                roleInformations = await roleInformationRepository.SearchRoles(searchCriteria);
            }
            return roleInformations;
        }
    }
}
