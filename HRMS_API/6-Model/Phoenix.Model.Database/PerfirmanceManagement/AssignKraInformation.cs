using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Database.PerfirmanceManagement
{
    public class AssignKraInformation
    {
        public int RecordId { get; set; }
        public int KraSlno { get; set; }
        public int KpiSlno { get; set; }
        public int MaxScore { get; set; }
        public int DepartmentSlno { get; set; }
        public int DesignationSlno { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeName { get; set; }

        public int FrequencySlno { get; set; }
        public string KraName { get; set; }
        public string KpiName { get; set; }
        public string FrequencyName { get; set; }
        public string DepartmentName { get; set; }
        public string DesignationName { get; set; }
        public long CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public long? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int StatusId { get; set; }
    }
}
