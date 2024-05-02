using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Administration;
using Phoenix.Database.Repository.Employee;
using Phoenix.Database.Repository.TMS;
using Phoenix.Domain.TMS.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.Employee;
using Phoenix.Model.Business.TMS;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.TMS.Implementations
{
    public class TravelDomain : BaseDomain, ITravelDomain
    {
        private readonly IConfiguration configuration;
        public TravelDomain(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<TravelDetails>> GetEmployeeTravelDetails()
        {
            List<TravelDetails> travelDetails = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                travelDetails = await travelRepository.GetEmployeeTravelDetails();
            }
            return travelDetails;
        }
        public async Task<List<AssignBranchDetails>> GetEmployeeMappedBranchesDetails(int employeeSlno)
        {
            List<AssignBranchDetails> assignedBranches = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                assignedBranches = await travelRepository.GetEmployeeMappedBranchesDetails(employeeSlno);
            }
            return assignedBranches;
        }
        public async Task<List<LocationDetails>> GetFromLocationDetails(int? employeeSlno)
        {
            List<LocationDetails> assignedLocations = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                assignedLocations = await travelRepository.GetFromLocationDetails(employeeSlno);
            }
            return assignedLocations;
        }
        public async Task<List<ToLocationDetails>> GetToLocationDetails(int? fromlocationid)
        {
            List<ToLocationDetails> assignedToLocations = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                assignedToLocations = await travelRepository.GetToLocationDetails(fromlocationid);
            }
            return assignedToLocations;
        }

        public async Task<List<Location>> GetEmployeeLocation(int employeeSlno)
        {
            List<Location> locations = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                locations = await travelRepository.GetEmployeeLocation(employeeSlno);
            }
            return locations;
        }
        public async Task<bool> SaveBranchMappingDetails(List<AssignBranchDetails> assignBranchDetails)
        {
            bool isVisitPlanSaved = false;
            using (EmployeeTravelRepository employeeTravelRepository = new(configuration))
            {
                isVisitPlanSaved = await employeeTravelRepository.SaveBranchMappingDetails(assignBranchDetails);
            }
            return isVisitPlanSaved;
        }

        public async Task<bool> DeleteBranchMappingDetails(int recordID)
        {
            bool isDeleted = false;
            using (EmployeeTravelRepository employeeTravelRepository = new(configuration))
            {
                isDeleted = await employeeTravelRepository.DeleteBranchMappingDetails(recordID);
            }
            return isDeleted;
        }


        public async Task<bool> DeleteVisitPlanEmployeDetails(int travelID)
        {
            bool isDeletedEmployee = false;
            using (EmployeeTravelRepository employeeTravelRepository = new(configuration))
            {
                isDeletedEmployee = await employeeTravelRepository.DeleteVisitPlanEmployeDetails(travelID);
            }
            return isDeletedEmployee;
        }
        public async Task<bool> SaveVisitPlanDetails(List<CreatePlanDetails> createPlanDetails)
        {
            bool isPlanSaved = false;
            using (EmployeeTravelRepository employeeTravelRepository = new(configuration))
            {
                isPlanSaved = await employeeTravelRepository.SaveVisitPlanDetails(createPlanDetails);
            }
            return isPlanSaved;
        }

        public async Task<List<CreatePlanDetails>> GetApprovalVisitPlan(int employeeSlno)
        {
            List<CreatePlanDetails> createPlanDetails = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                createPlanDetails = await travelRepository.GetApprovalVisitPlan(employeeSlno);
            }
            return createPlanDetails;
        }
        public async Task<List<CreatePlanDetails>> GetEmployeeTravelByID(int travelID)
        {
            List<CreatePlanDetails> createPlanDetailsbyID = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                createPlanDetailsbyID = await travelRepository.GetEmployeeTravelByID(travelID);
            }
            return createPlanDetailsbyID;
        }
        
        public async Task<List<CreatePlanDetails>> GetEmployeeApporvalTravelByID(int travelID, int employeeSlno)
        {
            List<CreatePlanDetails> createPlanDetailsbyID = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                createPlanDetailsbyID = await travelRepository.GetEmployeeApporvalTravelByID(travelID, employeeSlno);
            }
            return createPlanDetailsbyID;
        }
        public async Task<bool> UpdateEmployeeVisitiApproval(CreatePlanDetails updatePlanDetails)
        {
            bool isUpdated = false;
            using (EmployeeTravelRepository updateTravelRepository = new(configuration))
            {
                isUpdated = await updateTravelRepository.UpdateEmployeeVisitiApproval(updatePlanDetails);
            }
            return isUpdated;
        }
        
        public async Task<List<EmployeeToLocation>> GetEmployeeToLocationByID(int fromLocationid)
        {
            List<EmployeeToLocation> tolocationDetailsbyID = null;
            using (EmployeeTravelRepository travelRepository = new(configuration))
            {
                tolocationDetailsbyID = await travelRepository.GetEmployeeToLocationByID(fromLocationid);
            }
            return tolocationDetailsbyID;
        }
       
      

    }
}
