using Phoenix.Model.Business.Investment;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Investment.Interfaces
{
    public interface IInvestmentDomain 
    {
        Task<InvestmentDeclaration> GetInvestmentDeclaration(int finSLNo, int employeeSLNo);
        Task<InvestmentDeclaration> SaveInvestmentDeclarations(InvestmentDeclaration investmentDeclaration);
        Task<List<AssessmentTypeDetails>> GetAssesseeTypeDetails();
        Task<List<HRALocations>> GetHRALocations();
        Task<TaxDeductionDetails> GetIncomeTaxPaymentDetails(int employeeSLNo);
    }
}
