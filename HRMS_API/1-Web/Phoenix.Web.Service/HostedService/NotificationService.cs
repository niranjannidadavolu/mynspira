using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Hosting;

using Phoenix.Application.Notification.Interfaces;
using Phoenix.Model.Business.Notification;
using Phoenix.Web.Service.Hubs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Web.Service.HostedService
{
    public class NotificationService : IHostedService
    {
        bool enableGlobalTimer = false;
        PeriodicTimer timer;

        private readonly IMemoryCache memoryCache;
        private readonly IHubContext<SignalrHub> hub;
        private readonly INotificationApplication notificationApplication;

        public NotificationService(IMemoryCache memoryCache, IHubContext<SignalrHub> hub, INotificationApplication notificationApplication)
        {
            this.memoryCache = memoryCache;
            this.hub = hub;
            this.notificationApplication = notificationApplication;
            timer = new PeriodicTimer(TimeSpan.FromSeconds(20));
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            GetNotifications();
            enableGlobalTimer = true;
            return Task.CompletedTask;
        }

        private async Task GetNotifications()
        {
            List<NotificationDetail> notifications = new List<NotificationDetail>();
            Dictionary<string, string>  hubClients = memoryCache.Get("HubClients") as Dictionary<string, string>;
            
                while (await timer.WaitForNextTickAsync())
                {
                if (hubClients != null)
                {
                    foreach (KeyValuePair<string, string> item in hubClients)
                    {
                        int employeeSlno = item.Value.ToInt32OrDefault();
                        notifications = await notificationApplication.GetNotifications(employeeSlno);
                        await hub.Clients.Clients(item.Key).SendAsync("ShowNotifications", notifications);
                    }
                }
            }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
