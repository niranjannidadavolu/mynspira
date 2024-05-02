using Phoenix.Model.Business.EmployeeVerification;
using System.Threading.Tasks;

namespace Phoenix.Application.EmployeeVerification.Interfaces
{
    public interface IEmployeeVerificationApplication
    {
        Task<bool> SaveEmployeeVerifiedData(string idempotencyId, int employeeSlno);
        Task<Root> GetVerficationResult(string idempotencyId, int employeeSlno);
        Task<bool> UpdateEmployeeVerificationStatus(EmployeeVerificationStatusReq req);
    }
}
