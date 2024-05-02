using Microsoft.Extensions.Configuration;
using Phoenix.Application.TMS.Interfaces;
using Phoenix.Domain.TMS.Interfaces;
using Phoenix.Model.Business.TMS;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Base;

namespace Phoenix.Application.TMS.Implementations
{
    public class TravelApplication :BaseApplication, ITravelApplication
    {
        private readonly ITravelDomain _travelApplication;
        private readonly IConfiguration _configuration;
        public TravelApplication(ITravelDomain travelApplication, IConfiguration  configuration) :  base(configuration)
        {
            this._configuration = configuration;
            this._travelApplication = travelApplication;
        }
        public async Task<List<TravelDetails>> GetEmployeeTravelDetails()
        {
            List<TravelDetails>  travelDetails  = await _travelApplication.GetEmployeeTravelDetails();
            return travelDetails;
        }
        public async Task<List<AssignBranchDetails>> GetEmployeeMappedBranchesDetails(int employeeSlno)
        {
            List<AssignBranchDetails>  assignBranchDetails = await _travelApplication.GetEmployeeMappedBranchesDetails(employeeSlno);
            return assignBranchDetails;
        }

        public async Task<List<LocationDetails>> GetFromLocationDetails(int? employeeSlno)
        {
            List<LocationDetails>  locationDetails = await _travelApplication.GetFromLocationDetails(employeeSlno);
            return locationDetails;
        }
        public async Task<List<ToLocationDetails>> GetToLocationDetails(int? fromlocationid)
        {
            List<ToLocationDetails>  toLocationDetails = await _travelApplication.GetToLocationDetails(fromlocationid);
            return toLocationDetails;
        }
        public async Task<List<Location>> GetEmployeeLocation(int employeeSlno)
        {
            List<Location> locations = await _travelApplication.GetEmployeeLocation(employeeSlno);
            return locations;
        }
      
        public async Task<bool> SaveBranchMappingDetails(List<AssignBranchDetails> travelDetails)
        {
            bool isSaveBranchDetails = await _travelApplication.SaveBranchMappingDetails(travelDetails);
            return isSaveBranchDetails;
        }

        public async Task<bool> DeleteBranchMappingDetails(int record_id)
        {
            bool isDeletedMappingRecord = await _travelApplication.DeleteBranchMappingDetails(record_id);
            return isDeletedMappingRecord;
        }
        public async Task<bool> DeleteVisitPlanEmployeDetails(int travelId)
        {
            bool isDeletedEmployee = await _travelApplication.DeleteVisitPlanEmployeDetails(travelId);
            return isDeletedEmployee;
        }
    
        public async Task<bool> SaveVisitPlanDetails(List<CreatePlanDetails> createPlanDetails)
        {
            bool isSavedPlanDetails = await _travelApplication.SaveVisitPlanDetails(createPlanDetails);
            return isSavedPlanDetails;
        }
       
        public async Task<List<CreatePlanDetails>> GetApprovalVisitPlan(int employeeslno)
        {
            List<CreatePlanDetails> createPlanDetails = await _travelApplication.GetApprovalVisitPlan(employeeslno);
            return createPlanDetails;
        }
        
        public async Task<List<CreatePlanDetails>> GetEmployeeTravelByID(int travelID)
        {
            List<CreatePlanDetails> createPlanDetailsbyID = await _travelApplication.GetEmployeeTravelByID(travelID);
            return createPlanDetailsbyID;
        }
        public async Task<List<CreatePlanDetails>> GetEmployeeApporvalTravelByID(int travelID, int employeeSlno)
        {
            List<CreatePlanDetails> approvelPlanDetailsbyID = await _travelApplication.GetEmployeeApporvalTravelByID(travelID, employeeSlno);
            return approvelPlanDetailsbyID;
        }
        public async Task<bool> UpdateEmployeeVisitiApproval(CreatePlanDetails updatePlanDetails)
        {
            bool isUpdated = await _travelApplication.UpdateEmployeeVisitiApproval(updatePlanDetails);
            return isUpdated;
        }
        
        public async Task<List<EmployeeToLocation>> GetEmployeeToLocationByID(int fromLocationid)
        {
            List<EmployeeToLocation> createPlanDetailsbyID = await _travelApplication.GetEmployeeToLocationByID(fromLocationid);
            return createPlanDetailsbyID;
        }
    }
}
