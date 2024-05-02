using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.PMS;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using Phoenix.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.PMS.Implementations
{
    public class FrequencyInformationDomain : BaseDomain, IFrequencyInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public FrequencyInformationDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<FrequencyInformation>> LoadAllFrequencies()
        {
            List<FrequencyInformation>  frequencies = null;
            using (FrequencyInformationRepositry assignKRARepositry = new FrequencyInformationRepositry(this.configuration, this.redisCache))
            {
                frequencies = await assignKRARepositry.LoadAllFrequencies();
            }
            return frequencies;
        }
    }
}
