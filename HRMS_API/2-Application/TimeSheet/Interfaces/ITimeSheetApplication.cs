using Phoenix.Model.Business.TimeSheet;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.TimeSheet.Interfaces
{
    public interface ITimeSheetApplication
    {
        Task<List<TimeSheetProjectDetails>> GetEmployeeProjectDetails(int empSLNo);
    }
}
