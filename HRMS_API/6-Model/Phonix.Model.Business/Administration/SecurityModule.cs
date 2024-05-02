using Phoenix.Infrastructure.BusinessModel;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Model.Business.Administration
{
    public class SecurityModule : BaseBusinessEntity
    {

        public int Id { get; set; }

        public string Name { get; set; }

        public bool Expanded { get; set; }

        public bool IsSelected { get; set; }

        public int RoleId { get; set; }

        public int? ParentId { get; set; }

        public int? SerialNumber { get; set; }

        public int? ParentSerialNumber { get; set; }

        public string NodeType { get; set; }

        public NodeLevel NodeLevel { get; set; }

        public bool Isactive { get; set; }

        public bool RolePermission { get; set; }

        public List<SecurityModule> Items { get; set; }
    }
}