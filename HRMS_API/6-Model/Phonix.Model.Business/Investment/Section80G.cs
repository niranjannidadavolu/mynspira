using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Investment
{
    public class Section80G
    {
        public Section80G()
        {
            Section80GDetails = new List<Section80GDetail>();
        }
        public int Section80GSlno { get; set; }
        public int SubHeadSlno { get; set; }
        public int TdsEmployeeSlno { get; set; }
        public int FinSlno { get; set; }
        public int EmployeeSlNo { get; set; }
        public int EmpSlno { get; set; }
        public int UniqueNo { get; set; }
        public decimal Amount { get; set; }
        public decimal VerifiedAmount { get; set; }
        public string? VerifiedRemarks { get; set; }
        public int VerifiedUserSlNo { get; set; }
        public int FileCount { get; set; }
        public string Particulars { get; set; }
        public List<Section80GDetail> Section80GDetails { get; set; }
        public object SectionName { get; set; }
        public object Chapter6DetailId { get; set; }
        public object SubHeadId { get; set; }
    }

}
