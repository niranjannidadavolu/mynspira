using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Masters
{
    public class Branch
    {
        public int PBranchSLNo { get; set; }
        public string BranchName { get; set; }
        public int OfficeTypeSlno { get; set; }
        public string OfficeTypeName { get; set; }
        public int LegalBranchSlno { get; set; }
        public string ApexName { get; set; }

    }
    public class BranchRMS
    {
        public int PBranchSLNo { get; set; }
        public string BranchName { get; set; }
        public int OfficeTypeSlno { get; set; }

        public string OfficeTypeName { get; set; }
        public string ApexName { get; set; }

    }
}
