using Phoenix.Application.Masters.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Masters.Implementations
{
    public class BranchApplication : IBranchApplication
    {
        private readonly IBranchDomain branchDomain;
        public BranchApplication(IBranchDomain branchDomain)
        {
            this.branchDomain = branchDomain;
        }
        public async Task<List<Branch>> GetHRBranch(int employeeSlno)
        {
            List<Branch> branch = await branchDomain.GetHRBranch(employeeSlno);
            return branch;
        }
        public async Task<List<BranchRMS>> GetHRBranchRMS(int employeeSlno)
        {
            List<BranchRMS> branch = await branchDomain.GetHRBranchRMS(employeeSlno);
            return branch;
        }
        public async Task<List<Branch>> GetBranchesByOfcType(int officeTypeSlno,int employeeSlno)
        {
            List<Branch> branch = await branchDomain.GetBranchesByOfcType(officeTypeSlno, employeeSlno);
            return branch;
        }
        public async Task<List<OfficeType>> GetOfficeType()
        {
            List<OfficeType> officeType = await branchDomain.GetOfficeType();
            return officeType;
        }

        public async Task<List<Branch>> GetAllBranches()
        {
            List<Branch> branches = await branchDomain.GetAllBranches();
            return branches;
        }
    }
}