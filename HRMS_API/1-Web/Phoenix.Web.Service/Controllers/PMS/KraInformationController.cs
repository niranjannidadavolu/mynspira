using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Interfaces;
using Microsoft.AspNetCore.Authorization;
using System.Threading.Tasks;
using Phoenix.Model.Business.PMS;
using System.Collections.Generic;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.PMS
{
    [Route("api/[controller]")]
    [ApiController]
    public class KraInformationController: BaseController
    {
        private readonly IKraInformationApplication addKraApplication;
        public KraInformationController(IKraInformationApplication addKraApplication)
        {
            this.addKraApplication = addKraApplication;
        }
        
        [Authorize]
        [HttpPost]
        [Route("SaveKRAInformation")]
        public async Task<bool> SaveKraInformation([FromBody] KraInformation KraInformation)
        {
            bool isSaved = await addKraApplication.SaveKraInformation(KraInformation);
            return isSaved;
        }
        [Authorize]
        [HttpGet]
        [Route("GetAllKRAInformations")]
        public async Task<List<KraInformation>> GetAllKraInformations()
        {
            List<KraInformation> kraInformations = await addKraApplication.GetAllKraInformations();
            return kraInformations;
        }
        [Authorize]
        [HttpDelete]
        [Route("DeleteKRAInformation")]
        public async Task<bool> DeleteKRAInformation(string KraSlno)
        {
            bool isSaved = await addKraApplication.DeleteKRAInformation(KraSlno);
            return isSaved;
        }
        [Authorize]
        [HttpGet]
        [Route("CheckDuplicateKra")]
        public async Task<bool> CheckDuplicateKra(int kraSlno, string kraName)
        {
            bool isDuplicateKra = await addKraApplication.CheckDuplicateKra(kraSlno, kraName);
            return isDuplicateKra;
        }
    }
}
