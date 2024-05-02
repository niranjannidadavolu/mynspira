using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Model.Business.Employee;

namespace Phoenix.Model.Business.TravelManagement
{
    public class AssignBranch
    {
        public AssignBranch()
        {
            this.SelectedBranches = null;
            this.EmployeeSlNo = 0;
        }
        public int EmployeeSlNo { get; set; }
        public List<LocationMappingDetail>? SelectedBranches { get; set; }
        public long CreatedByUserId { get; set; }
    }
}
