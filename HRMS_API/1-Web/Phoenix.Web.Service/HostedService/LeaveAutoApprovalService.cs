using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Hosting;
using Phoenix.Web.Service.Hubs;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Threading;
using System;
using Phoenix.Model.Business.LeaveAutoApproval;
using Phoenix.Application.LeaveAutoApproval.Interfaces;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Web.Service.HostedService
{
    public class LeaveAutoApprovalService : IHostedService
    {
        private readonly ILoggerManager logger;
        private readonly Timer AutoApprovalTimer;
        private readonly ILeaveAutoApprovalApplication leaveautoapprovals;
        private bool isFlag = true;

        public LeaveAutoApprovalService(ILoggerManager logger, ILeaveAutoApprovalApplication leaveautoapprovals)
        {
            this.logger = logger;
            this.leaveautoapprovals = leaveautoapprovals;
            AutoApprovalTimer= new Timer(LeaveAutoApproval, null, TimeSpan.Zero, TimeSpan.FromSeconds(10));
        }

        public async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Auto Approval Service Started.");
            await Task.CompletedTask;
        }

        private async void LeaveAutoApproval(object state)
        {
            if (isFlag)
            {

                if (JobSettings.Current.AutoApprovalJob)
                {
                    if (JobSettings.Current.AutoApprovalJob && ApplicationSettings.Current.Environment.ToUpper() == "PROD")
                    {
                        isFlag = false;
                        if (DateTime.Now.Day == 26 && DateTime.Now.Hour > 0 && DateTime.Now.Hour < 4)
                        {
                            await leaveautoapprovals.LeaveAutoApprovals();
                        }
                    }
                }
                isFlag = true;
            }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

       

    }
}
