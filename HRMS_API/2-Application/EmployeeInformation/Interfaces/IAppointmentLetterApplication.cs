using Phoenix.Model.Business.Employee;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.EmployeeInformation.Interfaces
{
    public interface IAppointmentLetterApplication
    {
        Task<List<AppointmentLetter>> GetPendingAppointmentLetter();
        Task UpdateAppointmentLetterStatus(int employeeNumber);
    }
}
