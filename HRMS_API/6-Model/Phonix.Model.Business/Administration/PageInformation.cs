using Phoenix.CrossCutting.Enumerations;
using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.Administration
{
    public class PageInformation : BaseBusinessEntity
    {
        public int ScreenId { get; set; }
        public string ScreenName { get; set; }
        public string ScreenRoute { get; set; }

        public string Label { get; set; }
        public string Icon { get; set; }
        public string Link { get; set; }
        public bool IsTitle { get; set; }
        public string Badge { get; set; }
        public int? ParentScreenId { get; set; }
        public bool IsLayout { get; set; }
        public string Description { get; set; }
        public int DisplayOrder { get; set; }
        public int Status { get; set; }

        public List<PageInformation> PageInformations
        {
            get;
            set;
        }
        public Enumerations.NodeLevel NodeLevel { get; set; }
        public string NodeType { get; set; }
    }
}