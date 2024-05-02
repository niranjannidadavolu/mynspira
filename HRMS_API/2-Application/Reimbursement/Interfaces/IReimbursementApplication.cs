using Phoenix.Model.Business.Reimbursement;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Phoenix.Application.Reimbursement.Interfaces
{
    public interface IReimbursementApplication
    {
        Task<List<ApprovedReimbursement>> GetApprovedBills(int employeeNumber);
        Task<List<PendingReimbursement>> GetPendingBills(int employeeNumber);
        Task<bool> UploadReimburesement(UploadReimbursmentDetails uploadReimbursmentDetails);
        Task<bool> DeleteReimbursementBill(int reimbursementId);
    }
}
