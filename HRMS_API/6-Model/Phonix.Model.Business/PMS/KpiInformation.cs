using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.PMS
{
    public class KpiInformation: BaseBusinessEntity
    {
        public int KpiSlno { get; set; }
        public string KpiName { get; set; }
        public string Description { get; set; }
        public int? KraSlno { get; set; }
        public string? KraName { get; set; }
        public int FrequencySlno { get; set; }
        public string? FrequencyName { get; set; }
        public string Measurement { get; set; }
        public int MinThresholdValues { get; set; }
        public int MaxThresholdValues { get; set; }



    }
}
