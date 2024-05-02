using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Implementations;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.PerformanceManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class FrequencyInformationController : ControllerBase
    {
        private readonly IFrequencyInformationApplication frequencyInformationApplication;

        public FrequencyInformationController(IFrequencyInformationApplication _frequencyInformationApplication)
        {
            frequencyInformationApplication = _frequencyInformationApplication;
        }
        
        [Authorize]
        [HttpGet]
        [Route("LoadAllFrequencies")]

        public async Task<List<FrequencyInformation>> LoadAllFrequencies()
        {
            List<FrequencyInformation> frequencyDetails = await frequencyInformationApplication.LoadAllFrequencies();
            return frequencyDetails;
        }
    }
}
