using Phoenix.Infrastructure.BusinessSearchCriteria;

namespace Phoenix.Model.Business.SearchCriteria.NSL
{
    public class EmployeeProfileSearchCriteria : SearchBaseEntity
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
    }
}
