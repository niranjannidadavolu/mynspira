using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.PMS;
using Phoenix.Domain.Base;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.PMS.Implementations
{
    public class ManagerPerformanceEvaluationDomain : BaseDomain, IManagerPerformanceEvaluationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public ManagerPerformanceEvaluationDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<MappedDepartmentInformation>> GetMyAssignedDepartments(int employeeSlno)
        {
            List<MappedDepartmentInformation> departmentInformation = null;
            using (ManagerPerformanceEvaluationRepository assinedDepartmentRepository = new ManagerPerformanceEvaluationRepository(this.configuration, this.redisCache))
            {
                departmentInformation = await assinedDepartmentRepository.GetMyAssignedDepartments(employeeSlno);
            }
            return departmentInformation;
        }
    }
}
