using Phoenix.Model.Business.CarLease;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.CarLease.Interfaces
{
    public interface ICarLeaseApplication
    {
        Task<List<CarLeaseBillName>> GetCarLeaseBillNames();
        Task<List<CarLeaseMaintenanceBalance>> GetCarLeaseMaintenanceBalance(int empSLNo);
        Task<List<CarLeaseMaintenancePendingBills>> GetCarLeaseMaintenancePendingBills(int empSLNo);
        Task<bool> UploadCarLeaseMaintenance(CarLeaseMaintenanceDetail uploadCarLeaseMaintenance);        
        Task<List<CarLeaseAgreementBills>> GetCarLeaseAgreementBills(int employeeSLNo);
        Task<bool> UploadCarLeaseAgreementBill(List<CarLeaseAgreementBills> carLeaseAgreementBillUpload);
        Task<bool> DeleteMaintenenceBill(int recordId);
    }
}
