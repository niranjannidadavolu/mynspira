using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Domain.PMS.Implementations;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using Phoenix.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Application.Base;

namespace Phoenix.Application.PMS.Implementations
{
    public class FrequencyInformationApplication : BaseApplication, IFrequencyInformationApplication
    {
        private readonly IConfiguration configuration;
        private readonly IFrequencyInformationDomain frequencyInformationDomain;

        public FrequencyInformationApplication(IConfiguration configuration, IDistributedCache redisCache, IFrequencyInformationDomain _FrequencyInformationDomain) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            frequencyInformationDomain = _FrequencyInformationDomain;
        }

        public async Task<List<FrequencyInformation>> LoadAllFrequencies()
        {
            List<FrequencyInformation> frequencies = await frequencyInformationDomain.LoadAllFrequencies();
            return frequencies;
        }

    }
}
