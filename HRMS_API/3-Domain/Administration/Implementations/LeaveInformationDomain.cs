
﻿using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Administration;
using Phoenix.Domain.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
 using System.Collections.Generic;
using System.Threading.Tasks;
 using Phoenix.Domain.Base;

 namespace Phoenix.Domain.Administration.Implementations
{
    public class LeaveInformationDomain : BaseDomain,ILeaveInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;
        public LeaveInformationDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }


        public async Task<List<LeaveInformation>> GetLeaveInformation()
        {
            List<LeaveInformation> empLeaveStatusList = null;
            using (LeaveInformationRepository leaveInformationRepository = new(configuration, redisCache))
            {
                empLeaveStatusList = await leaveInformationRepository.GetLeaveInformation();
            }
            return empLeaveStatusList;
        }

        public  async Task<bool> UpdateLeaveInformation(LeaveInformationSaveReq leaveInformation)
        {
            bool isLeavePolicyInfoSaved = false;
            using (LeaveInformationRepository leaveInformationRepository = new(configuration, redisCache))
            {
                isLeavePolicyInfoSaved = await leaveInformationRepository.UpdateLeaveInformation(leaveInformation);
            }
            return isLeavePolicyInfoSaved;
        }
        public async Task<bool> SavedLeaveInformation(LeaveInformationSaveReq leaveInformation)
        {
            bool isLeavePolicyInfoSaved = false;
            using (LeaveInformationRepository leaveInformationRepository = new(configuration, redisCache))
            {
                isLeavePolicyInfoSaved = await leaveInformationRepository.SavedLeaveInformation(leaveInformation);
            }
            return isLeavePolicyInfoSaved;
        }
        public async Task<bool> DeleteLeaveInformation(int leaveInformationId)
        {
            bool isLeavePolicyInfoSaved = false;
            using (LeaveInformationRepository leaveInformationRepository = new(configuration, redisCache))
            {
                isLeavePolicyInfoSaved = await leaveInformationRepository.DeleteLeaveInformation(leaveInformationId);
            }
            return isLeavePolicyInfoSaved;
        }
        public async Task<List<LeaveTypeInformation>> GetLeaveInformationByOfc(int officeTypeSlno, int? branchSlno)
        {
            List<LeaveTypeInformation> leaveTypeInformation = null;
            using (LeaveInformationRepository leaveInformationRepository = new(configuration, redisCache))
            {
                leaveTypeInformation = await leaveInformationRepository.GetLeaveInformationByOfc(officeTypeSlno,branchSlno);
            }
            return leaveTypeInformation;
        }
    }
}
