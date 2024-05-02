using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

using Phoenix.Application.Districts.Interfaces;
using Phoenix.Model.Business.Districts;
using Phoenix.Web.Service.Hubs;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;
using AuthorizeAttribute = Microsoft.AspNetCore.Authorization.AuthorizeAttribute;

namespace Phoenix.Web.Service.Controllers.Districts
{
    [Route("api/[controller]")]
    [ApiController]
    public class DistrictsController : BaseController
    {
        private readonly IDistrictsApplication districtsApplication;
        private readonly IHubContext<SignalrHub> hubContext;

        public DistrictsController(IDistrictsApplication districtsApplication, IHubContext<SignalrHub> hub)
        {
            this.districtsApplication = districtsApplication;
            this.hubContext = hub;
        }

        [Authorize]
        [HttpGet]
        [Route("GetDistricts")]
        public async Task<List<DistrictDetails>> GetDistricts(int stateSlNo)
        {
            List<DistrictDetails> districts = await districtsApplication.GetDistrictDetails(stateSlNo);
            return districts;
        }

        [HttpGet]
        [Route("GetSignalRDistricts")]
        public async Task<List<DistrictDetails>> GetSignalRDistricts()
        {
            List<DistrictDetails> districts = await districtsApplication.GetDistrictDetails(15);
            await hubContext.Clients.All.SendAsync("MessageReceivedFromHub", districts);
            await hubContext.Clients.All.SendAsync("newUserConnected", "Hello Seshu...............");
            return districts;
        }
    }
}
