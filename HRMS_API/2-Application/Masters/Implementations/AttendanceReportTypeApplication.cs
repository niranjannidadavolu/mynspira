using Phoenix.Application.Masters.Interfaces;
using Phoenix.Domain.Masters.Interfaces;
using Phoenix.Model.Business.Masters;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Masters.Implementations
{
    public class AttendanceReportTypeApplication : IAttendanceReportTypeApplication
    {
        private readonly IAttendanceReportTypeDomain attendanceReportTypeDomain;
        public AttendanceReportTypeApplication(IAttendanceReportTypeDomain attendanceReportTypeDomain)
        {
            this.attendanceReportTypeDomain = attendanceReportTypeDomain;
        }
        public async Task<List<AttendanceReportType>> GetAttendanceReportTypes()
        {
            List<AttendanceReportType> reportTypes = await attendanceReportTypeDomain.GetAttendanceReportTypes();
            return reportTypes;
        }
    }
}
