using System;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Application.Base
{
    public abstract class BaseApplication : IBaseApplication, IDisposable
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logManager;

        public BaseApplication(IConfiguration configuration)
        {
            this.configuration = configuration;
        }
        public BaseApplication(IConfiguration configuration, IDistributedCache redisCache)
        {
            this.configuration = configuration;
        }

        private bool disposedValue = false; // To detect redundant calls

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                }
                this.disposedValue = true;
            }
        }

        public void Dispose()
        {
            this.Dispose(true); // TODO: uncomment the following line if the finalizer is overridden above.// GC.SuppressFinalize(this);
        }
    }
}
