using Microsoft.Extensions.Logging;
using Phoenix.CrossCutting.Helper.Cron;
using System.Threading.Tasks;
using System.Threading;
using System;
using Phoenix.Application.SendEmailNotification.Implementations;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.SendEmailNotification;
using System.Collections.Generic;
using Phoenix.Application.SendEmailNotification.Interfaces;
using System.Linq;
using System.Net.Mail;
using System.Net;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Caching.Memory;
using Phoenix.Application.Notification.Interfaces;
using Phoenix.Web.Service.Hubs;
using Phoenix.Model.Business.Notification;
using System.Timers;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Web.Service.CronJobs
{
    public class NotificationJob : CronJobService
    {
        private readonly IScheduleConfig<EmailNotificationJob> config;
        private readonly ILoggerManager logger;
        private readonly IMemoryCache memoryCache;
        private readonly IHubContext<SignalrHub> hub;
        private readonly INotificationApplication notificationApplication;
        private bool isFlag = true;

        public NotificationJob(IScheduleConfig<EmailNotificationJob> config, ILoggerManager logger, IMemoryCache memoryCache, IHubContext<SignalrHub> hub, INotificationApplication notificationApplication)
            : base(config.CronExpression, config.TimeZoneInfo)
        {
            this.config=config;
            this.logger=logger;
            this.memoryCache=memoryCache;
            this.hub=hub;
            this.notificationApplication=notificationApplication;
        }

        public override async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Notification Job starts.");
            await base.StartAsync(cancellationToken);
        }

        public override async Task DoWork(CancellationToken cancellationToken)
        {
            logger.LogInfo(string.Format("{0} : Email Notification Job is Working.", DateTime.Now.ToString("T")));
            if (isFlag)
            {
                Dictionary<string, string> hubClients = memoryCache.Get("HubClients") as Dictionary<string, string>;
                if (hubClients != null)
                {
                    foreach (KeyValuePair<string, string> item in hubClients)
                    {
                        int employeeSlno = item.Value.ToInt32OrDefault();
                        List<NotificationDetail> notifications = await notificationApplication.GetNotifications(employeeSlno);
                        await hub.Clients.Clients(item.Key).SendAsync("ShowNotifications", notifications);
                    }
                }
                isFlag = true;
            }
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Notification Job Stopping.");
            await base.StopAsync(cancellationToken);
        }
    }
}
