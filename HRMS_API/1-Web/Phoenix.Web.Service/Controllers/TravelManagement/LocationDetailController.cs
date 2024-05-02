using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.TMS.Interfaces;
using Phoenix.Application.TravelManagement.Interfaces;
using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.SearchCriteria.TravelManagement;
using Phoenix.Model.Business.TMS;
using Phoenix.Model.Business.TravelManagement;

namespace Phoenix.Web.Service.Controllers.TravelManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocationDetailController : ControllerBase
    {
        private readonly ILocationDetailApplication locationDetailApplication;
        public LocationDetailController(ILocationDetailApplication locationDetailApplication)
        {
            this.locationDetailApplication = locationDetailApplication;
        }

        [Authorize]
        [HttpPost]
        [Route("GetTravelLocationDetails")]
        public async Task<PagedResultSet<LocationDetail>> GetTravelLocationDetails([FromBody] TravelLocationSearchCriteria searchCriteria)
        {
            PagedResultSet<LocationDetail> travelDetails = await locationDetailApplication.GetTravelLocationDetails(searchCriteria);
            return travelDetails;
        }

        [Authorize]
        [HttpGet]
        [Route("GetTravelLocations")]
        public async Task<List<LocationDetail>> GetTravelLocations()
        {
            List<LocationDetail> travelDetails = await locationDetailApplication.GetTravelLocations();
            return travelDetails;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveLocationDetails")]

        public async Task<bool> SaveLocationDetails([FromBody] LocationDetail locationDetail)
        {
            bool isSaved = false;
            isSaved = await locationDetailApplication.SaveLocationDetails(locationDetail);
            ;
            return isSaved;
        }

        [Authorize]
        [HttpGet]
        [Route("ActivateTravelLocationDetail")]
        public async Task<bool> ActivateTravelLocationDetails(int locationId)
        {
            return false;
        }

        [Authorize]
        [HttpGet]
        [Route("DeActivateTravelLocationDetail")]
        public async Task<bool> DeActivateTravelLocationDetails(int locationId)
        {
            return false;
        }
    }
}
