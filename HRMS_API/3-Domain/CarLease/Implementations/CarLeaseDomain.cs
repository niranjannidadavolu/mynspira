using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.CarLease;
using Phoenix.Domain.CarLease.Interfaces;
using Phoenix.Model.Business.CarLease;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.CarLease.Implementations
{
    public class CarLeaseDomain: ICarLeaseDomain
    {
        private readonly IConfiguration configuration;

        public CarLeaseDomain(IConfiguration configuration)
        {
            this.configuration = configuration;

        }

        public async Task<List<CarLeaseBillName>> GetCarLeaseBillNames()
        {
            using (CarLeaseRepository carLeaseRepository = new(configuration))
            {
                return await carLeaseRepository.GetCarLeaseBillNames();
            }
        }

        public async Task<List<CarLeaseMaintenanceBalance>> GetCarLeaseMaintenanceBalance(int empSLNo)
        {
            List<CarLeaseMaintenanceBalance> carLeaseMaintenanceBalance = null;
            using (CarLeaseRepository carLeaseRepository = new(configuration))
            {
                carLeaseMaintenanceBalance = await carLeaseRepository.GetCarLeaseMaintenanceBalance(empSLNo);
                decimal amount = 0;
                foreach (var item in carLeaseMaintenanceBalance)
                {
                    amount = amount + item.Balance;
                }
                if (carLeaseMaintenanceBalance.Count > 0)
                {
                    carLeaseMaintenanceBalance[0].TotalAmount = amount;
                }

            }
            return carLeaseMaintenanceBalance;
        }

        public async Task<List<CarLeaseMaintenancePendingBills>> GetCarLeaseMaintenancePendingBills(int empSLNo)
        {
            using (CarLeaseRepository carLeaseRepository = new(configuration))
            {
                return await carLeaseRepository.GetCarLeaseMaintenancePendingBills(empSLNo);
            }
        }

        public async Task<bool> UploadCarLeaseMaintenance(CarLeaseMaintenanceDetail uploadCarLeaseMaintenance)
        {
            using (CarLeaseRepository carLeaseRepository = new(configuration))
            {
                return await carLeaseRepository.UploadCarLeaseMaintenance(uploadCarLeaseMaintenance);
            }
        }

        public async Task<List<CarLeaseAgreementBills>> GetCarLeaseAgreementBills(int employeeSLNo)
        {
            using (CarLeaseRepository carLeaseRepository = new(configuration))
            {
                return await carLeaseRepository.GetCarLeaseAgreementBills(employeeSLNo);
            }
        }

        public async Task<bool> UploadCarLeaseAgreementBill(List<CarLeaseAgreementBills> carLeaseAgreementBillUpload)
        {
            using (CarLeaseRepository carLeaseRepository = new(configuration))
            {
                return await carLeaseRepository.UploadCarLeaseAgreementBill(carLeaseAgreementBillUpload);
            }
        }

        public async Task<bool> DeleteMaintenenceBill(int recordId)
        {
            using (CarLeaseRepository carLeaseRepository = new(configuration))
            {
                return await carLeaseRepository.DeleteMaintenenceBill(recordId);
            }
        }
    }
}
