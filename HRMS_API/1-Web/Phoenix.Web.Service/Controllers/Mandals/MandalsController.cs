using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.Mandals.Interfaces;
using Phoenix.Model.Business.Mandals;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Mandals
{
    [Route("api/[controller]")]
    [ApiController]
    public class MandalsController : BaseController
    {
        private readonly IMandalsApplication mandalsApplication;
        public MandalsController(IMandalsApplication mandalsApplication)
        {
            this.mandalsApplication = mandalsApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetMandals")]
        public async Task<List<MandalDetails>> GetMandals(int districtSlNo)
        {
            List<MandalDetails> mandals = await mandalsApplication.GetMandalDetails(districtSlNo);
            return mandals;
        }
    }
}
