using Phoenix.Infrastructure.BusinessSearchCriteria;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.SearchCriteria.TimeSheet
{
    public class ReporteeTimeSheetSearchCriteria : SearchBaseEntity
    {
        public int ReportingManagerSlno { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int ReportFor { get; set; }

    }
}
