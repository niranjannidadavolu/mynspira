using Phoenix.Database.Repository.TMS;
using Phoenix.Model.Business.TMS;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.TMS.Interfaces
{
    public interface ITravelDomain
    {
        Task<List<TravelDetails>> GetEmployeeTravelDetails(); 
        Task<List<AssignBranchDetails>> GetEmployeeMappedBranchesDetails(int employeeSlno);
        Task<List<LocationDetails>> GetFromLocationDetails(int? employeeSlno);

        Task<List<ToLocationDetails>> GetToLocationDetails( int? fromlocationid);
        Task<bool> SaveBranchMappingDetails(List<AssignBranchDetails> assignBranchDetails);
        Task<bool> DeleteBranchMappingDetails(int recordID);
        Task<bool> DeleteVisitPlanEmployeDetails(int travelID);
        Task<bool> SaveVisitPlanDetails(List<CreatePlanDetails> createPlanDetails);
        Task<List<Location>> GetEmployeeLocation(int employeeSlno);
        Task<List<CreatePlanDetails>> GetApprovalVisitPlan(int employeeSlno);
        Task<List<CreatePlanDetails>> GetEmployeeTravelByID(int travelID);
        Task<List<CreatePlanDetails>> GetEmployeeApporvalTravelByID(int travelID, int employeeSlno);
        Task<bool> UpdateEmployeeVisitiApproval(CreatePlanDetails updatePlanDetails);
        Task<List<EmployeeToLocation>> GetEmployeeToLocationByID(int fromLocationid);

    }
}
