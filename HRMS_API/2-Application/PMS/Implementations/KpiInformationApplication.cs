using Microsoft.AspNetCore.DataProtection.KeyManagement;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Domain.Administration.Implementations;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Application.Base;

namespace Phoenix.Application.PMS.Implementations
{
    public class KpiInformationApplication : BaseApplication, IKpiInformationApplication
    {
        private readonly IConfiguration configuration;
        private readonly IKpiInformationDomain kpiInformationDomain;

        public KpiInformationApplication(IConfiguration configuration, IDistributedCache redisCache, IKpiInformationDomain kpiInformationDomain) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.kpiInformationDomain = kpiInformationDomain;
        }

        public async Task<bool> SaveKpiInformation(KpiInformation kpiInformation)
        {
            bool isSaved = false;
            isSaved = await kpiInformationDomain.SaveKpiInformation(kpiInformation);
            return isSaved;
        }

        public async Task<List<KpiInformation>> GetAllKpiInformations()
        {
            List<KpiInformation> kpiInformations = await kpiInformationDomain.GetAllKpiInformations();
            return kpiInformations;
        }

        public async Task<bool> DeleteKpiInformation(int kpiId)
        {
            bool isDeleted = false;
            isDeleted = await this.kpiInformationDomain.DeleteKpiInformation(kpiId);
            return isDeleted;
        }

        public async Task<bool> CheckDuplicateKpi(int kpiId, string kpiName)
        {
            bool isDuplicateKra = false;
            isDuplicateKra = await this.kpiInformationDomain.CheckDuplicateKpi(kpiId, kpiName);
            return isDuplicateKra;
        }

        public async Task<bool> DeleteKPIInformation(int kpiId)
        {
            bool isDeleted = false;
            isDeleted = await this.kpiInformationDomain.DeleteKpiInformation(kpiId);
            return isDeleted;
        }
    }
}
