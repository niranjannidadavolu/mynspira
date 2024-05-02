using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Administration;
using Phoenix.Database.Repository.PMS;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.PMS.Implementations
{
    public class KpiInformationDomain : BaseDomain, IKpiInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public KpiInformationDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<bool> SaveKpiInformation(KpiInformation kpiInformation)
        {
            bool isSaved = false;
            using (KpiInformationRepositry kpiRepositry = new KpiInformationRepositry(configuration, redisCache))
            {
                isSaved = await kpiRepositry.SaveKpiInformation(kpiInformation);
            }
            return isSaved;
        }
        public async Task<List<KpiInformation>> GetAllKpiInformations() 
        {
            List<KpiInformation> kpiInformations = null;
            using (KpiInformationRepositry kpiRepositry = new KpiInformationRepositry(this.configuration, this.redisCache))
            {
                kpiInformations = await kpiRepositry.GetAllKpiInformations();
            }
            return kpiInformations;
        }

        public async Task<bool> DeleteKpiInformation(int kpiId)
        {
            bool isDeleted = false;
            using (KpiInformationRepositry kraRepositry = new KpiInformationRepositry(this.configuration, this.redisCache))
            {
                isDeleted = await kraRepositry.DeleteKpiInformation(kpiId);
            }
            return isDeleted;
        }

        public async Task<bool> CheckDuplicateKpi(int kpiId, string kpiName)
        {
            bool isDeleted = false;
            using (KpiInformationRepositry kraRepository = new KpiInformationRepositry(this.configuration, this.redisCache))
            {
                isDeleted = await kraRepository.CheckDuplicateKpi(kpiId, kpiName);
            }
            return isDeleted;
        }
    }
}
