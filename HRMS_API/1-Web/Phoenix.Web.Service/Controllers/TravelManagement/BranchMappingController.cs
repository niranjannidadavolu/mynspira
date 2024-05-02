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
    public class BranchMappingController : ControllerBase
    {
        private readonly IBranchMappingApplication locationMappingDetailApplication;
        public BranchMappingController(IBranchMappingApplication locationDetailApplication)
        {
            this.locationMappingDetailApplication = locationDetailApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("LoadAllBranchMappings")]
        public async Task<List<LocationMappingDetail>> LoadAllBranchMappings()
        {
            List<LocationMappingDetail> travelDetails = await locationMappingDetailApplication.LoadAllBranchMappings();
            return travelDetails;
        }

        [Authorize]
        [HttpGet]
        [Route("GetMappedLocationsByLocationId")]
        public async Task<List<LocationMappingDetail>> GetMappedLocationsByLocationId(int fromLocationId)
        {
            List<LocationMappingDetail> travelDetails = await locationMappingDetailApplication.GetMappedLocationsByLocationId(fromLocationId);
            return travelDetails;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveBranchMappings")]

        public async Task<bool> SaveBranchMappings([FromBody] List<LocationMappingDetail> locationDetails)
        {
            bool isSaved = false;
            isSaved = await locationMappingDetailApplication.SaveBranchMappings(locationDetails);
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
