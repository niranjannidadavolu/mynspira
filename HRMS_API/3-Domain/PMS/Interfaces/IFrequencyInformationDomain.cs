using Phoenix.Model.Business.PMS;
using Phoenix.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.PMS.Interfaces
{
    public interface IFrequencyInformationDomain : IBaseDomain
    {
        Task<List<FrequencyInformation>> LoadAllFrequencies();
    }
}
