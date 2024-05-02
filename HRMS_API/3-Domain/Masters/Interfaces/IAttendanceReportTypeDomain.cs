using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.Masters.Interfaces
{
    public interface IAttendanceReportTypeDomain
    {
        Task<List<AttendanceReportType>> GetAttendanceReportTypes();
    }
}
