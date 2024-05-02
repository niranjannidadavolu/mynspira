using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.AutoApproval;
using Phoenix.Domain.AutoApproval.Interfaces;
using Phoenix.Model.Business.LeaveAutoApproval;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Domain.AutoApproval.Implementations
{
    public class AutoApprovalDomain: IAutoApprovalDomain
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;

        public AutoApprovalDomain(IConfiguration configuration, ILoggerManager logger)
        {
            this.configuration = configuration;
            this.logger = logger;
        }

        public async Task GetAutoApprovals()
        {
            using (AutoApprovalRespository autoApprovalRespository = new(configuration, logger))
            {
                 await autoApprovalRespository.GetAutoApprovals();
            }
        }
    }
}
