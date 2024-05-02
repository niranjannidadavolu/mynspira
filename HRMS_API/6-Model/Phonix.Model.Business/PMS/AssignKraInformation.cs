using Phoenix.Infrastructure.BusinessModel;
using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.PMS
{
    public class AssignKraInformation : BaseBusinessEntity
    {
        public int RecordId { get; set; }
        public int KraKppMappingId { get; set; }
        public int KraSlno { get; set; }
        public int KpiSlno { get; set; }
        public int MaxScore { get; set; }
        public int DepartmentSlno { get; set;}
        public int DesignationSlno { get; set; }
        public int EmployeeSlno { get; set; }
        public int FrequencySlno {  get; set; }
        public string? KraName { get; set; }
        public string? KpiName { get; set; }
        public string? FrequencyName { get; set; }
        public string? DepartmentName { get; set; }
        public string? DesignationName { get; set; }
        public string KraDescription { get; set; }
        public string KpiDescription { get; set; }
        public string Measurement { get; set; }
        public double MinThresholdValues { get; set; }
        public double MaxThresholdValues { get; set; }



    }
}
