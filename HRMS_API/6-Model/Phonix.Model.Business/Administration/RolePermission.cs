
namespace Phoenix.Model.Business.Administration
{
    public partial class RolePermission
    {
        public virtual int RolePermissionId
        {
            get;
            set;
        }
        public virtual PermissionInformation PermissionInformation
        {
            get;
            set;
        }
        public virtual RoleInformation RoleInformation
        {
            get;
            set;
        }
    }
}