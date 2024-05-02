using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Caching.Memory;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Web.Service.Hubs
{
    public class sendingemailhub : Hub<ISendingEmail>
    {
        private HttpContext httpContext;
        public IMemoryCache _memoryCache;

        public sendingemailhub(IMemoryCache memoryCache)
        {
            _memoryCache = memoryCache;
        }

        public override Task OnConnectedAsync()
        {
            this.httpContext = this.Context.GetHttpContext();
            if (!_memoryCache.TryGetValue(Context.ConnectionId, out var loggedInEmployeeId))
            {
                var cacheExpiryOptions = new MemoryCacheEntryOptions
                {
                    Priority = CacheItemPriority.High,
                };
                loggedInEmployeeId = Context.GetHttpContext().Request.Query["loggedInUserId"];
                _memoryCache.Set(Context.ConnectionId, loggedInEmployeeId.ToStringOrDefault(), cacheExpiryOptions);
            }
            else
            {
                var k = Context.GetHttpContext().Request.Query["loggedInUserId"];
            }
            return base.OnConnectedAsync();
        }
    }
}
