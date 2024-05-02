using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.PMS
{
    public class KraKpiMapping
    {
        public KraKpiMapping(List<KraInformation> KraInformations, List<KpiInformation> KpiMappings)
        {
            this.KraInformations = KraInformations;
            this.KpiMappings = KpiMappings;
        }

        public List<KraInformation> KraInformations { get; }
        public List<KpiInformation> KpiMappings { get; }
    }
}
