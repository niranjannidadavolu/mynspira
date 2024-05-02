using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Administration
{
    public class BranchInformation
    {
        public int BranchSlno { get; set; }
        public string BranchName { get; set; }
        public List<BuildingInformation> Buildings { get; set; }
        public string ApexName { get; set; }
    }


    public class DbBranchInformation
    {
        public int BranchSlno { get; set; }
        public string BranchName { get; set; }
        public int BuildingSlno { get; set; }
        public string BuildingName { get; set; }

        public string Branch_Name { get; set; }
        public string Apex_Name { get; set; }

    }
}
