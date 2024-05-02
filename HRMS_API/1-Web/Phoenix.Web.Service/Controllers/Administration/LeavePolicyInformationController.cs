
using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Administration
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeavePolicyInformationController : BaseController
    {
        private readonly ILeavePolicyInformationApplication leavePolicyInformationApplication;

        public LeavePolicyInformationController(ILeavePolicyInformationApplication leavePolicyInformationApplication)
        {
            this.leavePolicyInformationApplication = leavePolicyInformationApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetLeavePolicyInformation")]
        public async Task<List<LeavePolicyInformation>> GetLeavePolicyInformation()
        {
            List<LeavePolicyInformation> leavePolicyInformationList = await leavePolicyInformationApplication.GetLeavePolicyInformation();

            leavePolicyInformationList = leavePolicyInformationList.OrderByDescending(x => x.PolicyName).ToList();
            return leavePolicyInformationList;
        }
        [Authorize]
        [HttpPost]
        [Route("SaveLeavePolicyInformation")]

        public async Task<bool> SaveLeavePolicyInformation([FromBody] LeavePolicyInformation userInformation)
        {
            bool isSaved = await leavePolicyInformationApplication.SaveLeavePolicyInformation(userInformation);
            return isSaved;
        }
        [Authorize]
        [HttpPost]
        [Route("UpdateLeavePolicyInformation")]

        public async Task<bool> UpdateLeavePolicyInformation([FromBody] LeavePolicyInformationReq userInformation)
        {
            bool isSaved = await leavePolicyInformationApplication.UpdateLeavePolicyInformation(userInformation);
            return isSaved;
        }
        [Authorize]
        [HttpDelete]
        [Route("DeleteLeavePolicyInformation")]

        public async Task<bool> DeleteLeavePolicyInformation(int policyID)
        {
            bool isSaved = await leavePolicyInformationApplication.DeleteLeavePolicyInformation(policyID);
            return isSaved;
        }
    }
}
