using Microsoft.Extensions.Configuration;
using Phoenix.Application.Base;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Application.PMS.Implementations
{
    public class ManagerPerformanceEvaluationApplication: BaseApplication, IManagerPerformanceEvaluationApplication
    {
        private readonly IConfiguration configuration;
        private readonly IManagerPerformanceEvaluationDomain managerPerformanceEvaluationDomain;

        public ManagerPerformanceEvaluationApplication(IConfiguration configuration, IManagerPerformanceEvaluationDomain managerPerformanceEvaluationDomain) : base(configuration)
        {
            this.configuration = configuration;
            this.managerPerformanceEvaluationDomain = managerPerformanceEvaluationDomain;
        }

        public async Task<List<MappedDepartmentInformation>> GetMyAssignedDepartments(int employeeSlno)
        {
            List<MappedDepartmentInformation> departmentInformation = null;
            departmentInformation = await this.managerPerformanceEvaluationDomain.GetMyAssignedDepartments(employeeSlno);
            return departmentInformation;
        }
    }
}
