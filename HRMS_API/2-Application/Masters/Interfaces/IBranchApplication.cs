using Phoenix.Model.Business.Masters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Masters.Interfaces
{
    public interface IBranchApplication
    {
        Task<List<Branch>> GetHRBranch(int employeeSlno);
        Task<List<BranchRMS>> GetHRBranchRMS(int employeeSlno);
        Task<List<Branch>> GetBranchesByOfcType(int officeTypeSlno, int employeeSlno);
        Task<List<OfficeType>> GetOfficeType();


        Task<List<Branch>> GetAllBranches();
    }
}
