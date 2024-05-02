using System.Xml.Linq;

namespace Phoenix.Model.Business.Investment
{
    public class TdsEmployeeSection80G
    {
        public int TDSEMPSHSLNO { get; set; }
        public int TDSEMPSLNO { get; set; }
        public int FINSLNO { get; set; }
        public int EMPLOYEESLNO { get; set; }
        public int EMPSLNO { get; set; }
        public int UNIQUENO { get; set; }
        public int SUBHEADSLNO { get; set; }
        public decimal AMOUNT { get; set; }
        public decimal VERIFIEDAMOUNT { get; set; }
        public string VERIFIEDREMARKS { get; set; }
        public int VERIFIEDUSERSLNO { get; set; }
        public string SECTION1 { get; set; }
        public string PARTICULARS { get; set; }
        public int FileCount { get; set; }
    }
}
