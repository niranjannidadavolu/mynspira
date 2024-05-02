using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Masters;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Implementations
{
    public class BranchDomain: IBranchDomain
    {
        private readonly IConfiguration configuration;
        public BranchDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public async Task<List<Branch>> GetHRBranch(int employeeSlno)
        {
            List<Branch> branchStatus = null;
            using (BranchRepository branchRepository = new BranchRepository(configuration))
            {
                branchStatus = await branchRepository.GetHRBranch(employeeSlno);
            }
            return branchStatus;
        }
        public async Task<List<BranchRMS>> GetHRBranchRMS(int employeeSlno)
        {
            List<BranchRMS> branchStatus = null;
            using (BranchRepository branchRepository = new BranchRepository(configuration))
            {
                branchStatus = await branchRepository.GetHRBranchRMS(employeeSlno);
            }
            return branchStatus;
        }
        public async Task<List<Branch>> GetBranchesByOfcType(int officeTypeSlno,int employeeSlno)
        {
            List<Branch> branchStatus = null;
            using (BranchRepository branchRepository = new BranchRepository(configuration))
            {
                branchStatus = await branchRepository.GetBranchesByOfcType(officeTypeSlno, employeeSlno);
            }
            return branchStatus;
        }
        public async Task<List<OfficeType>> GetOfficeType()
        {
            List<OfficeType> officeType = null;
            using (BranchRepository branchRepository = new BranchRepository(configuration))
            {
                officeType = await branchRepository.GetOfficeType();
            }
            return officeType;
        }

        public async Task<List<Branch>> GetAllBranches()
        {
            List<Branch> branches = null;
            using (BranchRepository branchRepository = new BranchRepository(configuration))
            {
                branches = await branchRepository.GetAllBranches();
            }
            return branches;
        }
    }
}
