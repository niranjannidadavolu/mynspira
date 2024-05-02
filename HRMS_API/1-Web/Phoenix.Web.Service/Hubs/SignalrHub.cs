using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;

using System;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Caching.Memory;
using NHibernate.Mapping;
using System.Collections.Generic;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Web.Service.Hubs
{
    public class SignalrHub : Hub<ISignalrHub>
    {
        private HttpContext httpContext;
        private readonly IMemoryCache _memoryCache;
        private Dictionary<string, string> hubClients;
        private readonly MemoryCacheEntryOptions cacheExpiryOptions;

        public SignalrHub(IMemoryCache memoryCache)
        {
            _memoryCache = memoryCache;
            cacheExpiryOptions = new MemoryCacheEntryOptions
            {
                Priority = CacheItemPriority.High,
            };
        }
        public override Task OnConnectedAsync()
        {
            string loggedInEmployeeId = string.Empty;

            hubClients = _memoryCache.Get<Dictionary<string, string>>("HubClients");
            if (hubClients == null)
            {
                hubClients = new Dictionary<string, string>();
            }

            this.httpContext = this.Context.GetHttpContext();
            if (!hubClients.ContainsValue(Context.ConnectionId))
            {
                loggedInEmployeeId = Context.GetHttpContext().Request.Query["loggedInUserId"];
                hubClients.Add(Context.ConnectionId, loggedInEmployeeId.ToStringOrDefault());
                _memoryCache.Set("HubClients", hubClients, cacheExpiryOptions);
            }
            else
            {

            }
            return base.OnConnectedAsync();
        }

        public void Hello()
        {
            Clients.Caller.DisplayMessage("Hello from the SignalrDemoHub!");
        }

        public void SimulateDataProcessing()
        {
            var stopwatch = new Stopwatch();
            stopwatch.Start();

            int progressPercentage = 0;
            var random = new Random();

            for (int i = 0; i < 10; i++)
            {
                int waitTimeMilliseconds = random.Next(100, 2500);
                Thread.Sleep(waitTimeMilliseconds);

                Clients.Caller.UpdateProgressBar(progressPercentage += 10);
            }

            stopwatch.Stop();

            Clients.Caller.DisplayProgressMessage($"Data processing complete, elapsed time: {stopwatch.Elapsed.TotalSeconds:0.0} seconds.");
        }
    }
}

