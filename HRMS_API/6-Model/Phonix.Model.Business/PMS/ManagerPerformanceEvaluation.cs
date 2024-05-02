using Phoenix.Infrastructure.BusinessModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.PMS
{
    public class ManagerPerformanceEvaluation : BaseBusinessEntity
    {
        public int EmployeeSlno { get; set; }
        public int Department { get; set; }
        public int Designation { get; set; }
        public int EmployeeCount { get; set; }
    }

    public class MappedDepartmentInformation
    {
        public int DepartmentSlno { get; set; }
        public int DesignationSlno { get; set; }
        public int EmployeeSlno { get; set; }
        public int EmployeeCount { get; set; }
        public string EmployeeName { get; set; }
        public string DepartmentName { get; set; }
        public string DesignationName { get; set; }

    }
}
