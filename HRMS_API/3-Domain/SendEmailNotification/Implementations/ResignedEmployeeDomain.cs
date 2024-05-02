using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.SendEmailNotification;
using Phoenix.Domain.SendEmailNotification.Interfaces;
using Phoenix.Model.Business.SendEmailNotification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.SendEmailNotification.Implementations
{
    public class ResignedEmployeeDomain: IResignedEmployeeDomain
    {
        private readonly IConfiguration configuration;
        public ResignedEmployeeDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<ResignedEmployee>> GetResignedEmployees()
        {
            using (ResignedEmployeeRepository resignedEmployeeRepository = new(configuration))
            {
                return await resignedEmployeeRepository.GetResignedEmployees();
            }
        }
    }
}
