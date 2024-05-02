using Phoenix.Model.Business.SendEmailNotification;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.SendEmailNotification.Interfaces
{
    public interface IResignedEmployeeApplication
    {
        Task<List<ResignedEmployee>> GetResignedEmployees();

    }
}
