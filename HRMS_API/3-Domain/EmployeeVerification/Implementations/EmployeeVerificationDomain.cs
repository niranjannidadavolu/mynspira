using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.EmployeeVerification;
using Phoenix.Database.Repository.Mandals;
using Phoenix.Domain.EmployeeVerification.Interfaces;
using Phoenix.Domain.Mandals.Interfaces;
using Phoenix.Model.Business.EmployeeVerification;
using Phoenix.Model.Business.Mandals;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.EmployeeVerification.Implementations
{
    public class EmployeeVerificationDomain : IEmployeeVerificationDomain
    {
        private readonly IConfiguration configuration;
        public EmployeeVerificationDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<bool> SaveEmployeeVerifiedData(string idempotencyId, int employeeSlno)
        {
            bool isVerified = false;

            using (EmployeeVerificationRespository employeeVerificationRepository = new EmployeeVerificationRespository(configuration))
            {

              isVerified =  await employeeVerificationRepository.SaveEmployeeVerifiedData(idempotencyId, employeeSlno);
            }
            return isVerified;
        }
        public async Task<Root> GetVerficationResult(string idempotencyId, int employeeSlno)
        {
            Root verificationResult = null;

            using (EmployeeVerificationRespository employeeVerificationRepository = new EmployeeVerificationRespository(configuration))
            {

                verificationResult = await employeeVerificationRepository.GetVerficationResult(idempotencyId,employeeSlno);
            }
            return verificationResult;
        }
        public async Task<bool> UpdateEmployeeVerificationStatus(EmployeeVerificationStatusReq req)
        {
            bool isVerified = false;

            using (EmployeeVerificationRespository employeeVerificationRepository = new EmployeeVerificationRespository(configuration))
            {

                isVerified = await employeeVerificationRepository.UpdateEmployeeVerificationStatus(req);
            }
            return isVerified;
        }
    }
}
