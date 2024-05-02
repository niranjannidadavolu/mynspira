using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.Investment.Interfaces;
using Phoenix.Model.Business.Investment;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;
using Phoenix.Web.Service.Base;

namespace Phoenix.Web.Service.Controllers.Investment
{
    [Route("api/[controller]")]
    [ApiController]
    public class InvestmentController : BaseController
    {
        private readonly IInvestmentApplication investmentApplication;
        private readonly ILoggerManager logger;

        public InvestmentController(IInvestmentApplication investmentApplication, ILoggerManager logger)
        {
            this.investmentApplication = investmentApplication;
            this.logger = logger;
        }

        [Authorize]
        [HttpGet]
        [Route("GetInvestmentDeclaration")]
        public async Task<InvestmentDeclaration> GetInvestmentDeclaration(int finSLNo, int employeeSLNo)
        {
            InvestmentDeclaration investmentDeclaration = await investmentApplication.GetInvestmentDeclaration(finSLNo, employeeSLNo);
            return investmentDeclaration;
        }

        [HttpPost]
        [Route("SaveInvestmentDeclarations")]
        public async Task<InvestmentDeclaration> SaveInvestmentDeclarations([FromBody] InvestmentDeclaration investmentDeclaration)
        {
            InvestmentDeclaration investmentDeclarations = await investmentApplication.SaveInvestmentDeclarations(investmentDeclaration);
            return investmentDeclarations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetAssesmentTypes")]
        public async Task<List<AssessmentTypeDetails>> GetAssesseeTypeDetails()
        {

            List<AssessmentTypeDetails> assessmentTypeDetails = await investmentApplication.GetAssesseeTypeDetails();
            return assessmentTypeDetails;
        }

        [Authorize]
        [HttpGet]
        [Route("GetHRALocations")]
        public async Task<List<HRALocations>> GetHRALocations()
        {
            List<HRALocations> hRALocations = await investmentApplication.GetHRALocations();
            return hRALocations;
        }

        [Authorize]
        [HttpGet]
        [Route("GetIncomeTaxPaymentDetails")]
        public async Task<TaxDeductionDetails> GetIncomeTaxPaymentDetails(int employeeSLNo)
        {
            TaxDeductionDetails  taxDeductionDetails = await investmentApplication.GetIncomeTaxPaymentDetails(employeeSLNo);
            return taxDeductionDetails;
        }

        
    }
}
