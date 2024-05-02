using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Newtonsoft.Json;

using Phoenix.Application.CarLease.Interfaces;
using Phoenix.Model.Business.CarLease;
using Phoenix.Web.Service.Base;

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Controllers.CarLease
{
    [Route("api/[controller]")]
    public class CarLeaseController : BaseApiController
    {
        private readonly ICarLeaseApplication carLeaseApplication;
        public CarLeaseController(ICarLeaseApplication carLeaseApplication)
        {
            this.carLeaseApplication = carLeaseApplication;
        }

        [Authorize]
        [HttpGet]
        [Route("GetCarLeaseBillNames")]
        public async Task<List<CarLeaseBillName>> GetCarLeaseBillNames()
        {
            List<CarLeaseBillName> carLeaseBillNames = await carLeaseApplication.GetCarLeaseBillNames();
            return carLeaseBillNames;
        }

        [Authorize]
        [HttpGet]
        [Route("GetCarLeaseMaintenanceBalance")]
        public async Task<List<CarLeaseMaintenanceBalance>> GetCarLeaseMaintenanceBalance(int empSLNo)
        {          
            List<CarLeaseMaintenanceBalance> carLeaseMaintenanceBalance = await carLeaseApplication.GetCarLeaseMaintenanceBalance(empSLNo);

            return carLeaseMaintenanceBalance;
        }

        [Authorize]
        [HttpDelete]
        [Route("DeleteMaintenenceBill")]
        public async Task<bool> DeleteMaintenenceBill(int recordId)
        {          
            bool response = await carLeaseApplication.DeleteMaintenenceBill(recordId);
            return response;
        }

        [Authorize]
        [HttpGet]
        [Route("GetCarLeaseMaintenancePendingBills")]
        public async Task<List<CarLeaseMaintenancePendingBills>> GetCarLeaseMaintenancePendingBills(int empSLNo)
        {
            List<CarLeaseMaintenancePendingBills> carLeaseMaintenancePendingBills = await carLeaseApplication.GetCarLeaseMaintenancePendingBills(empSLNo);
            return carLeaseMaintenancePendingBills;
        }

        [Authorize]
        [HttpPost]
        [Route("UploadCarLeaseMaintenance")]
        public async Task<bool> UploadCarLeaseMaintenance()
         {
            bool carLeaseMaintenancePendingBills = false;
            CarLeaseMaintenanceDetail carLeaseBills = JsonConvert.DeserializeObject<CarLeaseMaintenanceDetail>(Request.Form["CarLeaseBills"].ToString());
            if (carLeaseBills.File!=null)
            {
                carLeaseMaintenancePendingBills = await carLeaseApplication.UploadCarLeaseMaintenance(carLeaseBills);
            }
            return carLeaseMaintenancePendingBills;
        }

        #region Car lease agreements bills
        [HttpGet]
        [Route("GetCarLeaseAgreementBills")]
        public async Task<List<CarLeaseAgreementBills>> GetCarLeaseAgreementBills(int employeeSLNo)
        {
            List<CarLeaseAgreementBills> carLeaseAgreementBills = await carLeaseApplication.GetCarLeaseAgreementBills(employeeSLNo);
            return carLeaseAgreementBills;
        }

        [HttpPost]
        [Route("UploadCarLeaseAgreementBill")]
        public async Task<bool> UploadCarLeaseAgreementBill([FromBody] List<CarLeaseAgreementBills> carLeaseAgreementBillUpload)
        {
            List<CarLeaseAgreementBills> uploadedData = carLeaseAgreementBillUpload.Where(x => x.FileData != null && x.BillNo != 0).ToList();
            bool resp = await carLeaseApplication.UploadCarLeaseAgreementBill(uploadedData);
            return resp;
        }
        
        #endregion Car lease agreements bills
    }
}
