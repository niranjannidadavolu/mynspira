using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.States.Interfaces;
using Phoenix.Model.Business.States;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.States
{
    [Route("api/[controller]")]
    [ApiController]
    public class StatesController : BaseController
    {
        private readonly IStatesApplication statesApplication;
        public StatesController(IStatesApplication statesApplication)
        {
            this.statesApplication = statesApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetStates")]
        public async Task<List<StatesDetails>> GetStates()
        {
            List<StatesDetails> states = await statesApplication.GetStatesDetails();
            return states;
        }
    }
}
