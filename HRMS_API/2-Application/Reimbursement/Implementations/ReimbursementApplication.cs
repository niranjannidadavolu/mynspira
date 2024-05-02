using Phoenix.Application.Reimbursement.Interfaces;
using Phoenix.Domain.Reimbursement.Interfaces;
using Phoenix.Model.Business.Reimbursement;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Phoenix.Application.Reimbursement.Implementations
{
    public class ReimbursementApplication : IReimbursementApplication
    {
        private readonly IReimbursementDomain reimbursementDomain;

        public ReimbursementApplication(IReimbursementDomain reimbursementDomain)
        {
            this.reimbursementDomain = reimbursementDomain;
        }

        public async Task<bool> DeleteReimbursementBill(int reimbursementId)
        {
            bool resp = await reimbursementDomain.DeleteReimbursementBill(reimbursementId);
            return resp;
        }

        public async Task<List<ApprovedReimbursement>> GetApprovedBills(int employeeNumber)
        {
            List<ApprovedReimbursement> approvedBills = await reimbursementDomain.GetApprovedBills(employeeNumber);
            return approvedBills;
        }
        public async Task<List<PendingReimbursement>> GetPendingBills(int employeeNumber)
        {
            List<PendingReimbursement> pendingReimbursements = await reimbursementDomain.GetPendingBills(employeeNumber);
            return pendingReimbursements;
        }

        public async Task<bool> UploadReimburesement(UploadReimbursmentDetails uploadReimbursmentDetails)
        {
            bool resp = await reimbursementDomain.UploadReimburesment(uploadReimbursmentDetails);
            return resp;
        }
    }
}
