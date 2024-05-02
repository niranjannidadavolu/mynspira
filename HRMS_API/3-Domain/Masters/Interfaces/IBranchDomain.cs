using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Interfaces
{
    public interface IBranchDomain
    {
        Task<List<Branch>> GetHRBranch(int employeeSlno);
        Task<List<BranchRMS>> GetHRBranchRMS(int employeeSlno);
        Task<List<Branch>> GetBranchesByOfcType(int officeTypeSlno, int employeeSlno);
        Task<List<OfficeType>> GetOfficeType();


        Task<List<Branch>> GetAllBranches();
    }
}
