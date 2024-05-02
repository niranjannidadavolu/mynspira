using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.PMS.Interfaces
{
    public interface IManagerPerformanceEvaluationDomain
    {
        Task<List<MappedDepartmentInformation>> GetMyAssignedDepartments(int employeeSlno);
    }
}
