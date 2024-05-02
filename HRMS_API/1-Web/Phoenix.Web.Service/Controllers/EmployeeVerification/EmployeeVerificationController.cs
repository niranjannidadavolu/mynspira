using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

using Phoenix.Application.Districts.Interfaces;
using Phoenix.Application.EmployeeVerification.Interfaces;
using Phoenix.Model.Business.Districts;
using Phoenix.Model.Business.EmployeeVerification;
using Phoenix.Web.Service.Hubs;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;
using AuthorizeAttribute = Microsoft.AspNetCore.Authorization.AuthorizeAttribute;

namespace Phoenix.Web.Service.Controllers.EmployeeVerification
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeVerificationController : BaseController
    {
        private readonly IEmployeeVerificationApplication employeeVerificationApplication;

        public EmployeeVerificationController(IEmployeeVerificationApplication employeeVerificationApplication)
        {
            this.employeeVerificationApplication = employeeVerificationApplication;
        }

        [HttpGet]
        [Route("SaveEmployeeVerifiedData")]
        public async Task<bool> GetVerifiedResult(string idempotencyId, int employeeSlno)
        {
            bool isVerified = false;
            if (idempotencyId != null)
            {
                isVerified = await this.employeeVerificationApplication.SaveEmployeeVerifiedData(idempotencyId, employeeSlno);
            }
            return isVerified;
        }

        [HttpGet]
        [Route("GetVerifiedResult")]
        public async Task<Root> GetVerficationResult(string idempotencyId, int employeeSlno)
        {
            Root verificationResult = null;
            if (idempotencyId != null)
            {
                verificationResult = await this.employeeVerificationApplication.GetVerficationResult(idempotencyId, employeeSlno);
            }
            return verificationResult;
        }

        [HttpPut]
        [Route("UpdateEmployeeVerificationStatus")]
        public async Task<bool> UpdateEmployeeVerificationStatus([FromBody] EmployeeVerificationStatusReq req)
        {
            bool isVerified = false;
            if (req.EmployeeSlno != null)
            {
                isVerified = await this.employeeVerificationApplication.UpdateEmployeeVerificationStatus(req);
            }
            return isVerified;
        }

    }
}
