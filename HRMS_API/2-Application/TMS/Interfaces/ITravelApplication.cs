using Phoenix.Model.Business.Administration;
using Phoenix.Model.Business.TMS;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.TMS.Interfaces
{
    public interface ITravelApplication
    {
        Task<List<TravelDetails>> GetEmployeeTravelDetails();
        Task<List<AssignBranchDetails>> GetEmployeeMappedBranchesDetails(int employeeslno);
        Task<List<LocationDetails>> GetFromLocationDetails(int? employeeslno);
        Task<List<ToLocationDetails>> GetToLocationDetails( int? branchSlno);
        Task<bool> SaveBranchMappingDetails(List<AssignBranchDetails> saveMappingDetails);
        Task<bool> DeleteBranchMappingDetails(int Record_id);
        Task<bool> DeleteVisitPlanEmployeDetails(int TravelID);
        Task<bool> SaveVisitPlanDetails(List<CreatePlanDetails> createPlanDetails);
        Task<List<Location>> GetEmployeeLocation(int employeeslno);
        Task<List<CreatePlanDetails>> GetApprovalVisitPlan(int employeeslno);
        Task<List<CreatePlanDetails>> GetEmployeeTravelByID(int travelID);
        Task<List<CreatePlanDetails>> GetEmployeeApporvalTravelByID(int travelID, int employeeSlno);
        Task<bool> UpdateEmployeeVisitiApproval(CreatePlanDetails updatePlanDetails);
        Task<List<EmployeeToLocation>> GetEmployeeToLocationByID(int fromLocationid);

    }
}
