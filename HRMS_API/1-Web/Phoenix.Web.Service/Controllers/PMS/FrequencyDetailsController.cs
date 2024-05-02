using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Implementations;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using Phoenix.Web.Service.Helper;
using Phonix.Web.Service.Controllers.Base;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.PMS
{
    [Route("api/[Controller]")]
    [ApiController]
    public class FrequencyDetailsController : BaseController
    {
        private readonly IFrequencyDetailsApplication FrequencyDetailsApplication;

        public FrequencyDetailsController(IFrequencyDetailsApplication FrequencyDetailsApplication)
        {
            this.FrequencyDetailsApplication = FrequencyDetailsApplication;
        }
        [Authorize]
        [HttpGet]
        [Route("GetFrequencyDetails")]

        public async Task<List<FrequencyDetails>> GetFrequencyDetails()
        {
            List<FrequencyDetails> frequencyInformation = await FrequencyDetailsApplication.GetFrequencyDetails();
            return frequencyInformation;
        }
    }
}