using Phoenix.Model.Business.Payslips;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.Payslips.Interfaces
{
    /// <summary>
    /// Get Employee Payslip
    /// </summary>
    public interface IPayslipsDomain
    {
        Task<byte[]> DownloadPaySlip(int employeeSlno);
        Task<List<Payslip>> GetEmployeePayslip(string employeeSlno); 
    }
}
