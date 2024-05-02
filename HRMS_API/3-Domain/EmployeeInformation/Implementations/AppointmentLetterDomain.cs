using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Employee;
using Phoenix.Domain.EmployeeInformation.Interfaces;
using Phoenix.Model.Business.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.EmployeeInformation.Implementations
{
    public class AppointmentLetterDomain : BaseDomain, IAppointmentLetterDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public AppointmentLetterDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration=configuration;
            this.redisCache=redisCache;
        }

        public async Task<List<AppointmentLetter>> GetPendingAppointmentLetter()
        {
            List<AppointmentLetter> holidays = null;
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                holidays = await repository.GetPendingAppointmentLetter();
            }
            return holidays;
        }

        public async Task UpdateAppointmentLetterStatus(int employeeNumber)
        {
            using (EmployeeInformationRepository repository = new EmployeeInformationRepository(this.configuration, this.redisCache))
            {
                await repository.UpdateAppointmentLetterStatus(employeeNumber);
            }
        }
    }
}
