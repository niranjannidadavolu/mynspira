using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Application.PMS.Interfaces
{
    public interface IFrequencyInformationApplication
    {
        Task<List<FrequencyInformation>> LoadAllFrequencies();

    }
}
