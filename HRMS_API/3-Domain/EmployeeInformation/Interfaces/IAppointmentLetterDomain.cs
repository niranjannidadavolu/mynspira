using Phoenix.Model.Business.Employee;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.EmployeeInformation.Interfaces
{
    public interface IAppointmentLetterDomain
    {
        Task<List<AppointmentLetter>> GetPendingAppointmentLetter();
        Task UpdateAppointmentLetterStatus(int employeeNumber);
    }
}
