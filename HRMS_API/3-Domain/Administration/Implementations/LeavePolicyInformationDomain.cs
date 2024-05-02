using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Administration;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Administration.Implementations
{
    public class LeavePolicyInformationDomain:  ILeavePolicyInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public LeavePolicyInformationDomain(IConfiguration configuration, IDistributedCache redisCache) 
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<LeavePolicyInformation>> GetLeavePolicyInformation()
        {
            List<LeavePolicyInformation> empLeavePolicyList = null;
            using (LeavePolicyInformationRepositorycs leaveInformationRepository = new(configuration, redisCache))
            {
                empLeavePolicyList = await leaveInformationRepository.GetLeavePolicyInformation();
            }
            return empLeavePolicyList;
        }


        public async Task<bool> SaveLeavePolicyInformation(LeavePolicyInformation leavePolicyInformation)
        {
            bool isLeavePolicyInfoSaved = false;
            using (LeavePolicyInformationRepositorycs leavePolicyInformationRepository = new(configuration, redisCache))
            {
                isLeavePolicyInfoSaved = await leavePolicyInformationRepository.SaveLeavePolicyInformation(leavePolicyInformation);
            }
            return isLeavePolicyInfoSaved;
        }

        public async Task<bool> UpdateLeavePolicyInformation(LeavePolicyInformationReq leavePolicyInformation)
        {
            bool isLeavePolicyInfoSaved = false;
            using (LeavePolicyInformationRepositorycs leavePolicyInformationRepository = new(configuration, redisCache))
            {
                isLeavePolicyInfoSaved = await leavePolicyInformationRepository.UpdateLeavePolicyInformation(leavePolicyInformation);
            }
            return isLeavePolicyInfoSaved;
        }
        public async Task<bool> DeleteLeavePolicyInformation(int policyID)
        {
            bool isLeavePolicyInfoSaved = false;
            using (LeavePolicyInformationRepositorycs leavePolicyInformationRepository = new(configuration, redisCache))
            {
                isLeavePolicyInfoSaved = await leavePolicyInformationRepository.DeleteLeavePolicyInformation(policyID);
            }
            return isLeavePolicyInfoSaved;
        }


    }
}
