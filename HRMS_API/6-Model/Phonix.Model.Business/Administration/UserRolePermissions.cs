namespace Phoenix.Model.Business.Administration
{
    public class UserRolePermissions
    {
        public int UserId { get; set; }

        public int RoleId { get; set; }

        public List<SecurityModule> Permissions { get; set; }
    }
}