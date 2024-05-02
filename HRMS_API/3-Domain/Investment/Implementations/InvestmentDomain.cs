using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.Investment;
using Phoenix.Domain.Investment.Interfaces;
using Phoenix.Model.Business.Investment;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Domain.Investment.Implementations
{
    /// <summary>
    /// InvestmentDomain
    /// </summary>
    public class InvestmentDomain :  IInvestmentDomain
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;

        public InvestmentDomain(IConfiguration configuration, ILoggerManager logger) 
        {
            this.configuration = configuration;
            this.logger = logger;
        }

        public async Task<InvestmentDeclaration> GetInvestmentDeclaration(int finSLNo, int employeeSLNo)
        {
            using (InvestmentRepository InvestmentRepository = new(configuration, this.logger))
            {
                return await InvestmentRepository.GetInvestmentDeclaration(finSLNo, employeeSLNo);
            }
        }

        //public async Task<InvestmentDeclaration> UpdateInvestmentDeclaration(InvestmentDeclaration investmentDeclaration)
        //{
        //    using (InvestmentRepository InvestmentRepository = new(configuration))
        //    {
        //        return await InvestmentRepository.UpdateInvestmentDeclaration(investmentDeclaration);
        //    }
        //}

        public async Task<InvestmentDeclaration> SaveInvestmentDeclarations(InvestmentDeclaration investmentDeclaration)
        {
            using (InvestmentRepository InvestmentRepository = new(configuration, this.logger))
            {
                return await InvestmentRepository.SaveInvestmentDeclarations(investmentDeclaration);
            }
        }

        public async Task<List<AssessmentTypeDetails>> GetAssesseeTypeDetails()
        {
            using (InvestmentRepository InvestmentRepository = new(configuration, this.logger))
            {
                return await InvestmentRepository.GetAssesseeTypeDetails();
            }
        }

        public async Task<List<HRALocations>> GetHRALocations()
        {
            using (InvestmentRepository InvestmentRepository = new(configuration, this.logger))
            {
                return await InvestmentRepository.GetHRALocations();
            }
        }
        public async Task<TaxDeductionDetails> GetIncomeTaxPaymentDetails(int employeeSLNo)
        {
            using (InvestmentRepository InvestmentRepository = new(configuration, this.logger))
            {
                return await InvestmentRepository.GetIncomeTaxPaymentDetails(employeeSLNo);
            }
        }

    }
}
