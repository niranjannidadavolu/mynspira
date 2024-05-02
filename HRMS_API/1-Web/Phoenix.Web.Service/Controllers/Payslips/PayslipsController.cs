using Microsoft.AspNetCore.Mvc;
using Microsoft.Reporting.NETCore;
using Phoenix.Application.Payslips.Interfaces;
using Phoenix.Model.Business.Payslips;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Helper;
using Phoenix.Web.Service.Base;
using Phoenix.CrossCutting.Helper.Constants;

namespace Phoenix.Web.Service.Controllers.Payslips
{
    [Route("api/[controller]")]
    [ApiController]
    public class PayslipsController : BaseApiController
    {
        private readonly IPayslipsApplication payslipsApplication;
        public PayslipsController(IPayslipsApplication payslipsApplication)
        {
            this.payslipsApplication = payslipsApplication;                
        }

        [Authorize]
        [HttpGet]
        [Route("DownloadPaySlip")]
        public async Task<IActionResult> DownloadPaySlip(int employeeSlno)
        { 
            using var report = new LocalReport();
            byte[] payslipsDataRow = await payslipsApplication.DownloadPaySlip(employeeSlno);
            return File(payslipsDataRow, Constants.PDFMIMETYPE, Constants.PDFEXTENSION);
        }

        [Authorize]
        [HttpGet]
        [Route("GetEmployeePaylips")]
        public async Task<List<Payslip>> GetEmployeePaylips(string employeeSlno)
        {
            List<Payslip> payslips = await payslipsApplication.GetEmployeePayslip(employeeSlno);
            return payslips;
        }
    }
}
