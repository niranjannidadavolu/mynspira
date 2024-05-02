using Phoenix.Application.Payslips.Interfaces;
using Phoenix.Domain.Payslips.Interfaces;
using Phoenix.Model.Business.Payslips;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Payslips.Implementations
{
    /// <summary>
    /// Payslips Application
    /// </summary>
    public class PayslipsApplication: IPayslipsApplication
    {
        private readonly IPayslipsDomain payslipsDomain;
        public PayslipsApplication(IPayslipsDomain payslipsDomain)
        {
            this.payslipsDomain = payslipsDomain;
        }

        /// <summary>
        /// Get Employee Payslip
        /// </summary>
        /// <param name="employeeSlno"></param>
        /// <returns></returns>
        public async Task<byte[]> DownloadPaySlip(int employeeSlno)
        {
            byte[] payslips = await payslipsDomain.DownloadPaySlip(employeeSlno);
            return payslips;
        }

        /// <summary>
        /// Get MyPayslips
        /// </summary>
        /// <param name="employeeSlno"></param>
        /// <returns></returns>
        public async Task<List<Payslip>> GetEmployeePayslip(string employeeSlno)
        {
            List<Payslip> payslips = await payslipsDomain.GetEmployeePayslip(employeeSlno);
            return payslips;
        }
    }
}
