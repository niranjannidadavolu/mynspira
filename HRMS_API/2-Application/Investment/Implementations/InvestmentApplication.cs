using Phoenix.Application.Investment.Interfaces;
using Phoenix.Domain.Investment.Interfaces;
using Phoenix.Model.Business.Investment;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Application.Investment.Implementations
{
    public class InvestmentApplication :  IInvestmentApplication
    {
        private readonly IInvestmentDomain investmentDomain;
        private readonly ILoggerManager logger;

        public InvestmentApplication(IInvestmentDomain investmentDomain, ILoggerManager logger)
        {
            this.investmentDomain = investmentDomain;
            this.logger = logger;
        }

        public async Task<InvestmentDeclaration> GetInvestmentDeclaration(int finSLNo, int employeeSLNo)
        {
            InvestmentDeclaration tdsEmployeeHRADetails = await investmentDomain.GetInvestmentDeclaration(finSLNo, employeeSLNo);
            return tdsEmployeeHRADetails;
        }

        public async Task<InvestmentDeclaration> SaveInvestmentDeclarations(InvestmentDeclaration investmentDeclaration)
        {
            InvestmentDeclaration investment = await investmentDomain.SaveInvestmentDeclarations(investmentDeclaration);
            return investment;
        }
        public async Task<List<AssessmentTypeDetails>> GetAssesseeTypeDetails()
        {
            List <AssessmentTypeDetails> assessmentTypeDetails = await investmentDomain.GetAssesseeTypeDetails();
            return assessmentTypeDetails;
        }

        public async Task<List<HRALocations>> GetHRALocations()
        {
            List<HRALocations> hRALocations = await investmentDomain.GetHRALocations();
            return hRALocations;
        }
        public async Task<TaxDeductionDetails> GetIncomeTaxPaymentDetails(int employeeSLNo)
        {
            TaxDeductionDetails taxDeductionDetails = await investmentDomain.GetIncomeTaxPaymentDetails(employeeSLNo);
            return taxDeductionDetails;
        }
    }
}

