
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.Administration.Interfaces;
using Phoenix.Model.Business.Administration;
using Phoenix.Web.Service.Helper;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Administration
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeaveInformationController : BaseController
    {
        private readonly ILeaveInformationApplication leaveInformationApplication;

        public LeaveInformationController(ILeaveInformationApplication leaveInformationApplication)
        {
            this.leaveInformationApplication = leaveInformationApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetLeaveInformation")]
        public async Task<List<LeaveInformation>> GetLeaveInformation()
        {
            List<LeaveInformation> leaveInformationList = await leaveInformationApplication.GetLeaveInformation();

            leaveInformationList = leaveInformationList.OrderByDescending(x => x.LeaveInformationName).ToList();

            return leaveInformationList;
        }
        [Authorize]
        [HttpPost]
        [Route("UpdateLeaveInformation")]

        public async Task<bool> UpdateLeaveInformation([FromBody] LeaveInformationSaveReq leaveInformationn)
        {
            bool isSaved = await leaveInformationApplication.UpdateLeaveInformation(leaveInformationn);
            return isSaved;
        }
        [Authorize]
        [HttpPost]
        [Route("SavedLeaveInformation")]

        public async Task<bool> SavedLeaveInformation([FromBody] LeaveInformationSaveReq leaveInformationn)
        {
            bool isSaved = await leaveInformationApplication.SavedLeaveInformation(leaveInformationn);
            return isSaved;
        }

        [Authorize]
        [HttpDelete]
        [Route("DeleteLeaveInformation")]

        public async Task<bool> DeleteLeaveInformation(int leaveInformationId)
        {
            bool isSaved = await leaveInformationApplication.DeleteLeaveInformation(leaveInformationId);
            return isSaved;
        }
        [Authorize]
        [HttpGet]
        [Route("GetLeaveInformationByOfc")]
        public async Task<List<LeaveTypeInformation>> GetLeaveInformationByOfc(int officeTypeSlno, int? branchSlno)
        {
            List<LeaveTypeInformation> leaveTypeInformation = await leaveInformationApplication.GetLeaveInformationByOfc(officeTypeSlno, branchSlno);

            leaveTypeInformation = leaveTypeInformation.OrderByDescending(x => x.LeaveInformationId).ToList();
            return leaveTypeInformation;
        }
    }
}
