using System;
using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.PMS
{
    public class KraInformation : BaseBusinessEntity
    {
        public int? RecordId { get; set; }
        public int? KraSlno { get; set; }
        public int? KpiSlno { get; set; }
        public string? KraName { get; set; }
        public string? KpiName { get; set; }
        public int? FrequencySlno { get; set; }
        public int? MaxScore { get; set; }
        public string? Description { get; set;}
        public int? KpiCount { get; set; }
        public int DepartmentSlno { get; set; }
        public int DesignationSlno { get; set; }
        public int EmployeeSlno { get; set; }
        public string? DepartmentName { get; set; }
        public string? DesignationName { get; set; }
        public bool? Mapped { get; set; }
        public bool? IsDraft { get; set; }

    }
}
    