using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Interfaces;
using Microsoft.AspNetCore.Authorization;
using System.Threading.Tasks;
using Phoenix.Model.Business.PMS;
using System.Collections.Generic;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.PerformanceManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class KraInformationController : BaseController
    {
        private readonly IKraInformationApplication kraInformationApplication;
        public KraInformationController(IKraInformationApplication kraInformationApplication)
        {
            this.kraInformationApplication = kraInformationApplication;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveKRAInformation")]
        public async Task<bool> SaveKraInformation([FromBody] KraInformation KraInformation)
        {
            bool isSaved = await kraInformationApplication.SaveKraInformation(KraInformation);
            return isSaved;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAllKRAInformations")]
        public async Task<List<KraInformation>> GetAllKraInformations()
        {
            List<KraInformation> kraInformations = await kraInformationApplication.GetAllKraInformations();
            return kraInformations;
        }

        [Authorize]
        [HttpDelete]
        [Route("DeleteKRAInformation")]
        public async Task<bool> DeleteKRAInformation(string KraSlno)
        {
            bool isSaved = await kraInformationApplication.DeleteKRAInformation(KraSlno);
            return isSaved;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAllPendingInitiationReviews")]
        public async Task<List<DesignationKraInformation>> GetAllPendingInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            kraInformations = await this.kraInformationApplication.GetAllPendingInitiationReviews();
            return kraInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAllFinalInitiationReviews")]
        public async Task<List<DesignationKraInformation>> GetAllFinalInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            kraInformations = await this.kraInformationApplication.GetAllFinalInitiationReviews();
            return kraInformations;
        }

        [Authorize]
        [HttpGet]
        [Route("CheckDuplicateKra")]
        public async Task<bool> CheckDuplicateKra(int kraSlno, string kraName)
        {
            bool isDuplicateKra = await kraInformationApplication.CheckDuplicateKra(kraSlno, kraName);            
            return isDuplicateKra;
        }

    }
}
