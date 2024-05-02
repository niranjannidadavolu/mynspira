using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Hosting;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Phoenix.Application.Administration.Interfaces;
using Phoenix.Application.Notification.Implementations;
using Phoenix.Application.Notification.Interfaces;
using Phoenix.Model.Business.Notification;
using Phoenix.Web.Service.Hubs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;

namespace Phoenix.Web.Service.HostedService
{
    public class VisitorCountService : IHostedService
    {
        PeriodicTimer timer;
        private readonly IHubContext<SignalrHub> hub;
        private readonly IVistorCountApplication visitorCountApplication;

        public VisitorCountService(IHubContext<SignalrHub> hub, IVistorCountApplication visitorCountApplication)
        {
            this.hub = hub;
            this.visitorCountApplication = visitorCountApplication;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            timer = new PeriodicTimer(TimeSpan.FromSeconds(5));
            GetVisitorCount();
            return Task.CompletedTask;
        }

        private async void GetVisitorCount()
        {
            while (await timer.WaitForNextTickAsync())
            {
                int usersCount = await visitorCountApplication.GetVisitorCount();
                await hub.Clients.All.SendAsync("GetVisitorCount", usersCount);
            }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            timer.Dispose();
            return Task.CompletedTask;
        }
    }
}
