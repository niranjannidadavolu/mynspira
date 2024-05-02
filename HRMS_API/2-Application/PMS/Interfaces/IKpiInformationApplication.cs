using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Application.PMS.Interfaces
{
    public interface IKpiInformationApplication
    {
        Task<bool> SaveKpiInformation(KpiInformation kpiInformation);
        Task<List<KpiInformation>> GetAllKpiInformations();
        Task<bool> DeleteKpiInformation(int kpiId);
        Task<bool> CheckDuplicateKpi(int kpiId, string kpiName);
    }
}