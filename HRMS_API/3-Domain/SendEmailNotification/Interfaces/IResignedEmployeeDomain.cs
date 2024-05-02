using Phoenix.Model.Business.SendEmailNotification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.SendEmailNotification.Interfaces
{
    public interface IResignedEmployeeDomain
    {
        Task<List<ResignedEmployee>> GetResignedEmployees();

    }
}
