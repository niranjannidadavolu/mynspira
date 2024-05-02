using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.PerformanceManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class FreuqencyController : ControllerBase
    {
        private readonly IFrequencyInformationApplication assignKRAApplication;

        public FreuqencyController(IFrequencyInformationApplication _assignKRAApplication)
        {
            assignKRAApplication = _assignKRAApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetFrequencies")]

        public async Task<List<FrequencyInformation>> GetFrequenciesDetails()
        {
            List<FrequencyInformation> frequencyDetails = await assignKRAApplication.LoadAllFrequencies();
            return frequencyDetails;
        }
    }
}
