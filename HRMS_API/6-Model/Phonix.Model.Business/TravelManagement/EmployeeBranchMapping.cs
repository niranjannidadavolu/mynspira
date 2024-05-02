using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Model.Business.Employee;

namespace Phoenix.Model.Business.TravelManagement
{
    public class EmployeeBranchMapping
    {
        public EmployeeBranchMapping(List<LocationMappingDetail> locationDetails, List<EmployeeProfile> employeeProfiles)
        {
           this.LocationDetails = locationDetails;
           this.EmployeeProfiles = employeeProfiles;
        }

        public List<EmployeeProfile> EmployeeProfiles { get; set; }

        public List<LocationMappingDetail> LocationDetails { get; set; }
    }
}
