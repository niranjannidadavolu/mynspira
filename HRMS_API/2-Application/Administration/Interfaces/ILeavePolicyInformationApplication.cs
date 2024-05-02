using Phoenix.Model.Business.Administration;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Administration.Interfaces
{
    public interface ILeavePolicyInformationApplication
    {
        Task<List<LeavePolicyInformation>> GetLeavePolicyInformation();
        Task<bool> SaveLeavePolicyInformation(LeavePolicyInformation leavePolicyInformation); 
        Task<bool> UpdateLeavePolicyInformation(LeavePolicyInformationReq leavePolicyInformation); 
        Task<bool> DeleteLeavePolicyInformation(int policyID);
    }
}
