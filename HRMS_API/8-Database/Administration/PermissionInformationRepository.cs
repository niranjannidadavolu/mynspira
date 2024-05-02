using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;

using Phoenix.Infrastructure.Dapper;

namespace Phoenix.Database.Repository.Administration
{
    public class PermissionInformationRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public PermissionInformationRepository(IConfiguration configuration, IDistributedCache redisCache)
            : base(configuration)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }
    }
}
