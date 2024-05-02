using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Reimbursement;
using Phoenix.Domain.Reimbursement.Interfaces;
using Phoenix.Model.Business.Reimbursement;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Reimbursement.Implementations
{
    public class ReimbursementDomain : IReimbursementDomain
    {
        private readonly IConfiguration configuration;

        public ReimbursementDomain(IConfiguration configuration)
        {
            this.configuration = configuration;

        }

        public async Task<bool> DeleteReimbursementBill(int reimbursementId)
        {
            bool isDeleted = false;
            using (ReimbursementRepository reimbursementRepository = new(configuration))
            {
                isDeleted = await reimbursementRepository.DeleteReimbursementBill(reimbursementId);
            }
            return isDeleted;
        }

        public async Task<List<ApprovedReimbursement>> GetApprovedBills(int employeeNumber)
        {
            List<ApprovedReimbursement> approvedReimbursements = null;
            using (ReimbursementRepository reimbursementRepository = new(configuration))
            {
                approvedReimbursements = await reimbursementRepository.GetApprovedBills(employeeNumber);
            }
            return approvedReimbursements;
        }
        public async Task<List<PendingReimbursement>> GetPendingBills(int employeeNumber)
        {
            List<PendingReimbursement> pendingBills = null;
            using (ReimbursementRepository reimbursementRepository = new(configuration))
            {
                pendingBills = await reimbursementRepository.GetPendingBills(employeeNumber);
            }
            return pendingBills;
        }

        public async Task<bool> UploadReimburesment(UploadReimbursmentDetails uploadReimbursmentDetails)
        {
            using (ReimbursementRepository reimbursementRepository = new(configuration))
            {
                return await reimbursementRepository.UploadReimburesment(uploadReimbursmentDetails);
            }
        }
    }
}
