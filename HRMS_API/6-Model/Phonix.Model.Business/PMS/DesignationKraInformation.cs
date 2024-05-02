using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.PMS
{
    public class DesignationKraInformation
    {
        public int DesignationKraMappingId { get; set; }
        public int DepartmnetSlno { get; set; }
        public int DesignationSlno { get; set; }
        public string  DepartmentName { get; set; }
        public string DesignationName { get; set; }
        public int KraCount { get; set; }
        public int KraSlno { get; set; }
        public string kraName { get; set; }
        public bool IsDraft { get; set; }
    }
}
