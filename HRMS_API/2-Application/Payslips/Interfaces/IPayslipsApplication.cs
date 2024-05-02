using Phoenix.Model.Business.Payslips;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Payslips.Interfaces
{
    public interface IPayslipsApplication
    {
        Task<byte[]> DownloadPaySlip(int employeeSlno);
        Task<List<Payslip>> GetEmployeePayslip(string employeeSlno); 
    }    
}
