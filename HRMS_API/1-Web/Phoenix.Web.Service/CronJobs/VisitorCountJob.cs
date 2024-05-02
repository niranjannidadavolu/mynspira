using Phoenix.CrossCutting.Helper.Cron;
using System.Threading.Tasks;
using System.Threading;
using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Caching.Memory;
using Phoenix.Web.Service.Hubs;
using Phoenix.Application.Notification.Interfaces;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Web.Service.CronJobs
{
    public class VisitorCountJob : CronJobService
    {
        private readonly IScheduleConfig<VisitorCountJob> config;
        private readonly ILoggerManager logger;
        private readonly IMemoryCache memoryCache;
        private readonly IHubContext<SignalrHub> hub;
        private readonly IVistorCountApplication visitorCountApplication;
        private bool isFlag = true;

        public VisitorCountJob(IScheduleConfig<VisitorCountJob> config, ILoggerManager logger, IMemoryCache memoryCache, IHubContext<SignalrHub> hub, IVistorCountApplication visitorCountApplication)
            : base(config.CronExpression, config.TimeZoneInfo)
        {
            this.config=config;
            this.logger=logger;
            this.memoryCache=memoryCache;
            this.hub=hub;
            this.visitorCountApplication=visitorCountApplication;
        }

        public override async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email VisitorCount Job starts.");
            await base.StartAsync(cancellationToken);
        }

        public override async Task DoWork(CancellationToken cancellationToken)
        {
            logger.LogInfo(string.Format("{0} : Email VisitorCount Job is Working.", DateTime.Now.ToString("T")));
            if (isFlag)
            {
                int usersCount = await visitorCountApplication.GetVisitorCount();
                await hub.Clients.All.SendAsync("GetVisitorCount", usersCount);
            }
            isFlag = true;
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email VisitorCount Job Stopping.");
            await base.StopAsync(cancellationToken);
        }
    }
}
