using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.Administration
{
    public class UserRoleInformation : BaseBusinessEntity
    {
        public int RecordId { get; set; }
        public int UserId { get; set; }
        public int RoleId { get; set; }
        public DateTime EffectiveFrom { get; set; } 
        public DateTime? EffectiveTo { get; set; }
        public UserInformation UserInformation { get; set; }
        public RoleInformation RoleInformation { get; set; }
    }
}
