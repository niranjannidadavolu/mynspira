using Phoenix.Application.TimeSheet.Interfaces;
using Phoenix.Domain.TimeSheet.Interfaces;
using Phoenix.Model.Business.TimeSheet;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.TimeSheet.Implementations
{
    public class TimeSheetApplication : ITimeSheetApplication
    {
        private readonly ITimeSheetDomain timeSheetDomain;
        public TimeSheetApplication(ITimeSheetDomain timeSheetDomain) {
            this.timeSheetDomain = timeSheetDomain;
        }
        public async Task<List<TimeSheetProjectDetails>> GetEmployeeProjectDetails(int empSLNo)
        {
            List<TimeSheetProjectDetails> timeSheetProjectDetails = await timeSheetDomain.GetEmployeeProjectDetails(empSLNo);
            return timeSheetProjectDetails;
        }
    }
}
