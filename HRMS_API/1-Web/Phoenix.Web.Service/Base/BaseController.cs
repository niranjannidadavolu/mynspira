using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

namespace Phoenix.Web.Service.Base
{
    public class BaseController : ControllerBase
    {
        private readonly IConfiguration configuration;
        
        private IDistributedCache redisCache;

        public BaseController()
        {
            this.redisCache = redisCache;
        }

        public BaseController(IDistributedCache redisCache) : this()
        {
            this.redisCache = redisCache;
        }

        public BaseController(IConfiguration configuration, IDistributedCache redisCache) : this()
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }
    }
}