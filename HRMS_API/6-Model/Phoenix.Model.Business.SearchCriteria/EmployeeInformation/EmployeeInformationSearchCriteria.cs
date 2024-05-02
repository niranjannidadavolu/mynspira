using Phoenix.Infrastructure.BusinessSearchCriteria;

namespace Phoenix.Model.Business.SearchCriteria.EmployeeInformation
{
    public class EmployeeInformationSearchCriteria : SearchBaseEntity
    {
        public string SearchValue { get; set; }

        public int ManagerId { get; set; }

        public int IncludeSelf { get; set; }

    }
}
