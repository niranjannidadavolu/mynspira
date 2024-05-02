using System;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

namespace Phoenix.Domain.Base
{
    public abstract class BaseDomain : IBaseDomain, IDisposable
    {
        private bool disposedValue = false; // To detect redundant calls
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        protected BaseDomain(IConfiguration configuration, IDistributedCache redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }
        protected BaseDomain(IDistributedCache redisCache)
        {
            this.redisCache = redisCache;
        }
        protected BaseDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposedValue)
            {
                if (disposing)
                {
                    // TODO: dispose managed state (managed objects).
                }

                // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
                // TODO: set large fields to null.
                this.disposedValue = true;
            }
        }
        public void Dispose()
        {
            // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
            this.Dispose(true);

            // TODO: uncomment the following line if the finalizer is overridden above.
            // GC.SuppressFinalize(this);
        }
    }
}
