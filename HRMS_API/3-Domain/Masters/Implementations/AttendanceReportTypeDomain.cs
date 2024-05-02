using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Masters;
using Phoenix.Domain.LeaveManagement.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Implementations
{
    public class AttendanceReportTypeDomain : IAttendanceReportTypeDomain
    {
        private readonly IConfiguration configuration;
        public AttendanceReportTypeDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<AttendanceReportType>> GetAttendanceReportTypes()
        {
            List<AttendanceReportType> reportTypes = null;
            using (AttendanceReportTypeRepository AttendanceReportTypeRepository = new AttendanceReportTypeRepository(configuration))
            {
                reportTypes = await AttendanceReportTypeRepository.GetAttendanceReportTypes();
            }
            return reportTypes;
        }
    }
}
