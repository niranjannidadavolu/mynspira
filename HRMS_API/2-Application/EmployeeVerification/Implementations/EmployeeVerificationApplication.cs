using Phoenix.Application.EmployeeVerification.Interfaces;
using Phoenix.Domain.EmployeeVerification.Interfaces;
using Phoenix.Model.Business.EmployeeVerification;
using System.Threading.Tasks;

namespace Phoenix.Application.EmployeeVerification.Implementations
{
    public class EmployeeVerificationApplication : IEmployeeVerificationApplication
    {
        private readonly IEmployeeVerificationDomain employeeVerificationDomain;
        public EmployeeVerificationApplication(IEmployeeVerificationDomain employeeVerificationDomain)
        {
            this.employeeVerificationDomain = employeeVerificationDomain;
        }

        public async Task<bool> SaveEmployeeVerifiedData(string idempotencyId, int employeeSlno)
        {
            bool isVerified = false;

          isVerified =  await employeeVerificationDomain.SaveEmployeeVerifiedData(idempotencyId, employeeSlno);
            return isVerified;
        }
        public async Task<Root> GetVerficationResult(string idempotencyId, int employeeSlno)
        {
            Root verificationResult = null;

            verificationResult = await employeeVerificationDomain.GetVerficationResult(idempotencyId, employeeSlno);
            return verificationResult;
        }
        public async Task<bool> UpdateEmployeeVerificationStatus(EmployeeVerificationStatusReq req)
        {
            bool isVerified = false;

            isVerified = await employeeVerificationDomain.UpdateEmployeeVerificationStatus(req);
            return isVerified;
        }
    }
}
