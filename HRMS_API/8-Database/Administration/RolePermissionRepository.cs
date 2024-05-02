using System.Collections.Generic;

using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Administration;

namespace Phoenix.Database.Repository.Administration
{
    public class RolePermissionRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public RolePermissionRepository(IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public List<PermissionInformation> LoadMappedPermissions(int roleId)
        {
            List<PermissionInformation> permissions = null;
            //permissions = this.FindAll().Where(x => x.RoleInformation.RoleId == roleId).Select(x => x.PermissionInformation).ToList();
            return permissions;
        }

        public bool SavePermissions(List<SecurityModule> permissions, int roleId)
        {
            List<RolePermission> rolePermissions = null;
            List<RolePermission> toBeDeletedRolePermissions = null;
            rolePermissions = new List<RolePermission>();
            //List<SecurityModule> finalPermissions = permissions.Where(x => x.NodeLevel == Enumerations.NodeLevel.PagePermissions).ToList();

            //toBeDeletedRolePermissions = this.FindAll().Where(permission => permission.RoleInformation.RoleId == roleId).ToList();

            //this.DeleteAll(roleId, "RoleId");

            //foreach (SecurityModule securityModule in finalPermissions)
            //{
            //    RolePermission rolePermission = new RolePermission();
            //    rolePermission.PermissionInformation = this.PopulatePermisisonInformation(securityModule.Id);
            //    rolePermission.RoleInformation = PopulateRoleInformation(roleId);
            //    rolePermissions.Add(rolePermission);
            //}

            //this.SaveOrUpdateAll(rolePermissions);
            return true;
        }

        private RoleInformation PopulateRoleInformation(int roleId)
        {
            RoleInformation roleInformation = null;
            using (RoleInformationRepository roleRepository = new RoleInformationRepository(configuration, redisCache))
            {
                //roleInformation = roleRepository.FindById(roleId);
            }

            return roleInformation;
        }

        private PermissionInformation PopulatePermisisonInformation(int permissionId)
        {
            PermissionInformation permissionInformation = null;
            using (PermissionInformationRepository roleRepository = new PermissionInformationRepository(configuration, redisCache))
            {
                //permissionInformation = roleRepository.FindById(permissionId);
            }

            return permissionInformation;
        }
    }
}
