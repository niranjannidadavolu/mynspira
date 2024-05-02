using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.Administration.Implementations;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Application.Reimbursement.Implementations;
using Phoenix.Application.TMS.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Reimbursement;
using Phoenix.Model.Business.TMS;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.TMS
{
    [Route("api/[controller]")]
    [ApiController]
    public class TravelManagementController: ControllerBase
    {

        private readonly ITravelApplication travelApplication;
        public TravelManagementController(ITravelApplication travelApplication)
        {
            this.travelApplication = travelApplication;
        }
        [Authorize]
        [HttpGet]
        [Route("GetEmployeeTravelDetails")]
        public async Task<List<TravelDetails>> GetEmployeeTravelDetails()
        {
            List<TravelDetails> travelDetails = await travelApplication.GetEmployeeTravelDetails();
            return travelDetails;
        }
        
     
        [Authorize]
        [HttpGet]
        [Route("GetFromLocationDetails")]

        public async Task<List<LocationDetails>> GetFromLocationDetails(int? Employeeslno)
        {
            List<LocationDetails> fromLocations = await travelApplication.GetFromLocationDetails(Employeeslno);
            return fromLocations;
        }
        [Authorize]
        [HttpGet]
        [Route("GetToLocationDetails")]

        public async Task<List<ToLocationDetails>> GetToLocationDetails(int? fromlocationid)
        {
            List<ToLocationDetails> toLocations = await travelApplication.GetToLocationDetails(fromlocationid);
            return toLocations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeeLocation")]

        public async Task<List<Location>> GetEmployeeLocation(int Employeeslno)
        {
            List<Location>  locations= await travelApplication.GetEmployeeLocation(Employeeslno);
            return locations;
        }
        [Authorize]
        [HttpGet]
        [Route("GetEmployeeMappedBranchesDetails")]
        public async Task<List<AssignBranchDetails>> GetEmployeeMappedBranchesDetails(int Employeeslno)
        {
            List<AssignBranchDetails> mapingDetails = await travelApplication.GetEmployeeMappedBranchesDetails(Employeeslno);
            return mapingDetails;
        }
        [Authorize]
        [HttpPost]
        [Route("SaveBranchMappingDetails")]

        public async Task<bool> SaveBranchMappingDetails([FromBody] List<AssignBranchDetails> userInformation)
        {
            bool isSavedMappingDetails = await travelApplication.SaveBranchMappingDetails(userInformation);
            return isSavedMappingDetails;
        }
        [Authorize]
        [HttpDelete]
        [Route("DeleteBranchMapping")]

        public async Task<bool> DeleteBranchMappingDetails(int Record_id)
        {
            bool isDeleted = await travelApplication.DeleteBranchMappingDetails(Record_id);
            return isDeleted;
        }

        //DeleteVisitPlanEmployeDetails
        [Authorize]
        [HttpDelete]
        [Route("DeleteVisitPlanEmployeeByID")]

        public async Task<bool> DeleteVisitPlanEmployeDetails(int TravelID)
        {
            bool isDeletedEmployee = await travelApplication.DeleteVisitPlanEmployeDetails(TravelID);
            return isDeletedEmployee;
        }

        [Authorize]
        [HttpPost]
        [Route("SaveVisitPlanDetails")]

        public async Task<bool> SaveVisitPlanDetails([FromBody] List<CreatePlanDetails> createPlanDetails)
        {
            bool isVisitPlanSaved = await travelApplication.SaveVisitPlanDetails(createPlanDetails);
            return isVisitPlanSaved;
        }
       
        [Authorize]
        [HttpGet]
        [Route("GetApprovalVisitPlan")]

        public async Task<List<CreatePlanDetails>> GetApprovalVisitPlan(int Employeeslno)
        {
            List<CreatePlanDetails> ApproveDetails = await travelApplication.GetApprovalVisitPlan(Employeeslno);
            return ApproveDetails;
        }
        [Authorize]
        [HttpGet]
        [Route("GetEmployeeTravelByTravelID")]

        public async Task<List<CreatePlanDetails>> GetEmployeeTravelByID(int travelID)
        {
            List<CreatePlanDetails> TravelbyID = await travelApplication.GetEmployeeTravelByID(travelID);
            return TravelbyID;
        }
        
        [Authorize]
        [HttpGet]
        [Route("GetEmployeeApporvalTravelByID")]
        public async Task<List<CreatePlanDetails>> GetEmployeeApporvalTravelByID(int travelID, int employeeSlno)
        {
            List<CreatePlanDetails> TravelbyID = await travelApplication.GetEmployeeApporvalTravelByID(travelID, employeeSlno);
            return TravelbyID;
        }
        [Authorize]
        [HttpPost]
        [Route("UpdateVisitPlanApproval")]

        public async Task<bool> UpdateEmployeeVisitiApproval([FromBody] CreatePlanDetails updatePlanDetails)
        {
            bool isUpdated = await travelApplication.UpdateEmployeeVisitiApproval(updatePlanDetails);
            return isUpdated;
        }
        [Authorize]
        [HttpGet]
        [Route("GetEmployeeToLocationByID")]

        public async Task<List<EmployeeToLocation>> GetEmployeeToLocationByID(int fromLocationid)
        {
            List<EmployeeToLocation> TravelbyID = await travelApplication.GetEmployeeToLocationByID(fromLocationid);
            return TravelbyID;
          
        }

    }
}
