using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.EmployeeInformation.Interfaces;
using Phoenix.Model.Business.Employee;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Caching.Distributed;
using Phoenix.Application.Base;
using Phoenix.Domain.EmployeeInformation.Interfaces;

namespace Phoenix.Application.EmployeeInformation.Implementations
{
    public class AppointmentLetterApplication : BaseApplication, IAppointmentLetterApplication
    {
        private readonly IAppointmentLetterDomain appointmentLetterDomain;
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public AppointmentLetterApplication(IAppointmentLetterDomain appointmentLetterDomain, IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.appointmentLetterDomain=appointmentLetterDomain;
            this.configuration=configuration;
            this.redisCache=redisCache;
        }

        public async Task<List<AppointmentLetter>> GetPendingAppointmentLetter()
        {
            List<AppointmentLetter> attedance = await appointmentLetterDomain.GetPendingAppointmentLetter();
            return attedance;
        }

        public async Task UpdateAppointmentLetterStatus(int employeeNumber)
        {
            await appointmentLetterDomain.UpdateAppointmentLetterStatus(employeeNumber);
        }
    }
}
