using Phoenix.Model.Business.EmployeeVerification;
using Phoenix.Model.Business.Mandals;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.EmployeeVerification.Interfaces
{
    public interface IEmployeeVerificationDomain
    {
        Task<bool> SaveEmployeeVerifiedData(string idempotencyId, int employeeSlno);
        Task<Root> GetVerficationResult(string idempotencyId, int employeeSlno);
        Task<bool> UpdateEmployeeVerificationStatus(EmployeeVerificationStatusReq req);
    }
}
