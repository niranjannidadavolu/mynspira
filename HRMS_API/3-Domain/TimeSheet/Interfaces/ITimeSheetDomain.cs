using Phoenix.Model.Business.TimeSheet;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.TimeSheet.Interfaces
{
    public interface ITimeSheetDomain
    {
        Task<List<TimeSheetProjectDetails>> GetEmployeeProjectDetails(int empSLNo);
    }
}
