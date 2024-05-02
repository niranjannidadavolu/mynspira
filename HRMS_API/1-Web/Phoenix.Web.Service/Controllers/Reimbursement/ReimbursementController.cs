using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Application.Reimbursement.Interfaces;
using Phoenix.Model.Business.Reimbursement;
using System.Threading.Tasks;
using System.Collections.Generic;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Reimbursement
{
    /// <summary>
    ///  Employee Reimbursement
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class ReimbursementController : BaseApiController
    {
        private readonly IReimbursementApplication reimbursementApplication;
        public ReimbursementController(IReimbursementApplication reimbursementApplication)
        {
            this.reimbursementApplication = reimbursementApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetApprovedBills")]
        public async Task<List<ApprovedReimbursement>> GetApprovedBills(int employeeNumber)
        {
            List<ApprovedReimbursement> approvedBills = await reimbursementApplication.GetApprovedBills(employeeNumber);
            decimal amount = 0;
            foreach (var item in approvedBills)
            {
                amount = amount + item.Balance;
            }
            if(approvedBills.Count > 0)
            {
                approvedBills[0].TotalAmount = amount;
            }
            return approvedBills;

        }

        [Authorize]
        [HttpGet]
        [Route("GetPendingBills")]
        public async Task<List<PendingReimbursement>> GetPendingBills(int employeeNumber)
        {
            List<PendingReimbursement> pendingReimbursements = await reimbursementApplication.GetPendingBills(employeeNumber);
            return pendingReimbursements;
        }

        [Authorize]
        [HttpPost]
        [Route("UploadReimbursement")]
        public async Task<bool> UploadReimburesment(UploadReimbursmentDetails uploadReimbursmentDetails)
        {
            var resp = await reimbursementApplication.UploadReimburesement(uploadReimbursmentDetails);
            return resp;
        }

        [Authorize]
        [HttpGet]
        [Route("DeleteReimbursementBill")]
        public async Task<bool> DeleteReimbursementBill(int reimbursementId)
        {
            bool isDeleted = await reimbursementApplication.DeleteReimbursementBill(reimbursementId);
            return isDeleted;
        }
    }
}
