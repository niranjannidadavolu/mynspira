using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.TimeSheet;
using Phoenix.Domain.TimeSheet.Interfaces;
using Phoenix.Model.Business.TimeSheet;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.TimeSheet.Implementations
{
    public class TimeSheetDomain: ITimeSheetDomain
    {
        private readonly IConfiguration configuration;
        public TimeSheetDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<TimeSheetProjectDetails>> GetEmployeeProjectDetails(int empSLNo)
        {
            List<TimeSheetProjectDetails> empProjectsList = null;
            using (TimeSheetRepository timeSheetRepository = new(configuration))
            {
                empProjectsList = await timeSheetRepository.GetEmployeeProjectDetails(empSLNo);
            }
            return empProjectsList;
        }
    }
}
