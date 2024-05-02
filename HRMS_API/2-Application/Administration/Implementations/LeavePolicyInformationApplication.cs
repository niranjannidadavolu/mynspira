using Phoenix.Application.Administration.Interfaces;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Administration.Implementations
{
    public class LeavePolicyInformationApplication : ILeavePolicyInformationApplication
    {
        private readonly ILeavePolicyInformationDomain leavePolicyInformationDomain;
        public LeavePolicyInformationApplication(ILeavePolicyInformationDomain leavePolicyInformationDomain)
        {
            this.leavePolicyInformationDomain = leavePolicyInformationDomain;
        }

        public async Task<List<LeavePolicyInformation>> GetLeavePolicyInformation()
        {
            List<LeavePolicyInformation> leaveinformationdetails = await leavePolicyInformationDomain.GetLeavePolicyInformation();
            return leaveinformationdetails;
        }
        public async Task<bool> SaveLeavePolicyInformation(LeavePolicyInformation leavePolicyInformation)
        {
            bool isleaveinfoSaved = await leavePolicyInformationDomain.SaveLeavePolicyInformation(leavePolicyInformation);
            return isleaveinfoSaved;
        }
        public async Task<bool> UpdateLeavePolicyInformation(LeavePolicyInformationReq leavePolicyInformation)
        {
            bool isleaveinfoSaved = await leavePolicyInformationDomain.UpdateLeavePolicyInformation(leavePolicyInformation);
            return isleaveinfoSaved;
        }
        public async Task<bool> DeleteLeavePolicyInformation(int policyID)
        {
            bool isleaveinfoSaved = await leavePolicyInformationDomain.DeleteLeavePolicyInformation(policyID);
            return isleaveinfoSaved;
        }

    }
}
