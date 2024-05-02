using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.Administration
{
    public class RoleInformation : BaseBusinessEntity
    {
        public int RoleId { get; set; }

        public string RoleName { get; set; }

        public bool IsAdmin { get; set; }

        public string Description { get; set; }
        public bool Mapped { get; set; }


        public RoleInformation()
        {
            this.RoleName = string.Empty;
            this.Description = string.Empty;
        }
    }
}
