using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Domain.SendEmailNotification.Interfaces;
using Phoenix.Model.Business.SendEmailNotification;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.SendEmailNotification.Implementations
{
    public class ResignedEmployeeApplication: IResignedEmployeeApplication
    {
        private readonly IResignedEmployeeDomain resignedEmployeeDomain;
        public ResignedEmployeeApplication(IResignedEmployeeDomain resignedEmployeeDomain)
        {
            this.resignedEmployeeDomain = resignedEmployeeDomain;
        }

        public async Task<List<ResignedEmployee>> GetResignedEmployees()
        {
            Console.WriteLine("AApplication start");
            List<ResignedEmployee> sendemailDetails = await resignedEmployeeDomain.GetResignedEmployees();
            return sendemailDetails;
        }
    }
}
