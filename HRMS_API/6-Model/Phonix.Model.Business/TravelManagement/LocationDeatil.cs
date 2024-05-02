using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.TravelManagement
{
    public class LocationDetail: BaseBusinessEntity
    {
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public int EmployeeSlno { get; set; }
    }
}
