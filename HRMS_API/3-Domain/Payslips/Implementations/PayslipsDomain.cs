using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Payslips;
using Phoenix.Domain.Payslips.Interfaces;
using Phoenix.Model.Business.Payslips;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Payslips.Implementations
{
    /// <summary>
    /// Payslips Domain
    /// </summary>
    public class PayslipsDomain: IPayslipsDomain
    {
        private readonly IConfiguration configuration;
        public PayslipsDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        /// <summary>
        /// Get Employee Payslip
        /// </summary>
        /// <param name="employeeSlno"></param>
        /// <returns></returns>
        public async Task<byte[]> DownloadPaySlip(int employeeSlno)
        {
            using (PayslipsRepository payslipsRepository = new(configuration))
            {
                return await payslipsRepository.DownloadPaySlip(employeeSlno);
            }
        }       

        /// <summary>
        /// Get MyPayslips
        /// </summary>
        /// <param name="employeeSlno"></param>
        /// <returns></returns>
        public async Task<List<Payslip>> GetEmployeePayslip(string employeeSlno)
        {
            using (PayslipsRepository payslipsRepository = new(configuration))
            {
                return await payslipsRepository.GetEmployeePayslip(employeeSlno);
            }
        }
    }
}
