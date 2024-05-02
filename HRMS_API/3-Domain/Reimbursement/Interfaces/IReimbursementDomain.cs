using Phoenix.Model.Business.Reimbursement;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Reimbursement.Interfaces
{
    public interface IReimbursementDomain
    {
        Task<List<ApprovedReimbursement>> GetApprovedBills(int employeeNumber);
        Task<List<PendingReimbursement>> GetPendingBills(int employeeNumber);
        Task<bool> UploadReimburesment(UploadReimbursmentDetails uploadReimbursmentDetails);
        Task<bool> DeleteReimbursementBill(int reimbursementId);
    }
}
