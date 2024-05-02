using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using Phoenix.Web.Service.Base;
using Phoenix.Web.Service.Helper;

namespace Phoenix.Web.Service.Controllers.PerformanceManagement
{
    [Route("api/[Controller]")]
    [ApiController]
    public class KpiInformationController : BaseController
    {
        private readonly IKpiInformationApplication addKpiApplication;
        public KpiInformationController(IKpiInformationApplication addKpiApplication)
        {
            this.addKpiApplication = addKpiApplication;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveKpiInformation")]
        public async Task<bool> SaveKpiInformation([FromBody] KpiInformation kpiInformation)
        {
            bool isSaved = await addKpiApplication.SaveKpiInformation(kpiInformation);
            return isSaved;
        }
        [Authorize]
        [HttpGet]
        [Route("GetAllKpiInformations")]
        public async Task<List<KpiInformation>> GetAllKpiInformations()
        {
            List<KpiInformation> kpiInformations = await addKpiApplication.GetAllKpiInformations();
            return kpiInformations;
        }
        [Authorize]
        [HttpDelete]
        [Route("DeleteKpiInformation")]
        public async Task<bool> DeleteKpiInformation(int kpiId)
        {
            bool isSaved = await addKpiApplication.DeleteKpiInformation(kpiId);
            return isSaved;
        }

        [Authorize]
        [HttpGet]
        [Route("CheckDuplicateKpi")]
        public async Task<bool> CheckDuplicateKpi(int kpiId, string kpiName)
        {
            bool isDuplicateKpi = await addKpiApplication.CheckDuplicateKpi(kpiId, kpiName);
            return isDuplicateKpi;
        }

        [Authorize]
        [HttpGet]
        [Route("MapScore")]
        public async Task<bool> MapScore()
        {
            return false;
            //bool isDuplicateKpi = await addKpiApplication.CheckDuplicateKpi(kpiId, kpiName);
            //return isDuplicateKpi;
        }
    }
}