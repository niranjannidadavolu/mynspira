using Phoenix.Application.CarLease.Interfaces;
using Phoenix.Domain.CarLease.Interfaces;
using Phoenix.Model.Business.CarLease;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.CarLease.Implementations
{
    public class CarLeaseApplication : ICarLeaseApplication
    {
        private readonly ICarLeaseDomain carLeaseDomain;

        public CarLeaseApplication(ICarLeaseDomain carLeaseDomain)
        {
            this.carLeaseDomain = carLeaseDomain;
        }

        public async Task<List<CarLeaseBillName>> GetCarLeaseBillNames()
        {
            List<CarLeaseBillName> resp = await carLeaseDomain.GetCarLeaseBillNames();
            return resp;
        }

        public async Task<List<CarLeaseMaintenanceBalance>> GetCarLeaseMaintenanceBalance(int empSLNo)
        {
            List<CarLeaseMaintenanceBalance> resp = await carLeaseDomain.GetCarLeaseMaintenanceBalance(empSLNo);
            return resp;
        }

        public async Task<List<CarLeaseMaintenancePendingBills>> GetCarLeaseMaintenancePendingBills(int empSLNo)
        {
            List<CarLeaseMaintenancePendingBills> resp = await carLeaseDomain.GetCarLeaseMaintenancePendingBills(empSLNo);
            return resp;
        }

        public async Task<bool> UploadCarLeaseMaintenance(CarLeaseMaintenanceDetail uploadCarLeaseMaintenance)
        {
            bool resp = await carLeaseDomain.UploadCarLeaseMaintenance(uploadCarLeaseMaintenance);
            return resp;
        }
        public async Task<List<CarLeaseAgreementBills>> GetCarLeaseAgreementBills(int employeeSLNo)
        {
            List<CarLeaseAgreementBills> resp = await carLeaseDomain.GetCarLeaseAgreementBills(employeeSLNo);
            return resp;
        }

        public async Task<bool> UploadCarLeaseAgreementBill(List<CarLeaseAgreementBills> carLeaseAgreementBillUpload)
        {
            bool carLeaseAgreementBill = await carLeaseDomain.UploadCarLeaseAgreementBill(carLeaseAgreementBillUpload);
            return carLeaseAgreementBill;
        }
        public async Task<bool> DeleteMaintenenceBill(int recordId)
        {
           bool resp = await carLeaseDomain.DeleteMaintenenceBill(recordId);
           return resp;
        }
    }
}
