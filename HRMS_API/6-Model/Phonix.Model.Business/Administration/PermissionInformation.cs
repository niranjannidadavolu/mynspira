using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.Administration
{
    public class PermissionInformation : BaseBusinessEntity
    {
        public PermissionInformation()
        {
        }

        public bool? IsActive
        {
            get;
            set;
        }

        public int Level
        {
            get;
            set;
        }

        public string PermissionName
        {
            get;
            set;
        }

        public string PermissionCode
        {
            get;
            set;
        }

        public int PermissionId
        {
            get;
            set;
        }

        public PageInformation PageInformation
        {
            get;
            set;
        }
        public string PageName { get; set; }
        public string PageCode { get; set; }
        public string ModuleName { get; set; }
        public string ModuleCode { get; set; }
    }
}