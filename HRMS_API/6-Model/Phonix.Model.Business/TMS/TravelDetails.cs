using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.TMS
{
    public class TravelDetails
    {
        public int Pbranchslno { get; set; }
        public int ? Employeeslno { get; set; }
        public string ? Employeename { get; set; }
        public string EmployeeNumber { get; set; }
        public string EmployeeId { get; set; }

        public string ? Designation { get; set; }
        public string ? Branchname { get; set; }
        public string? Districtname { get; set; }
        public string ? Statename { get; set; }
        public int? Stateid { get; set; }
        public int? Segmentslno { get; set; }
        public string? Segmentname { get; set; }
    }
}
