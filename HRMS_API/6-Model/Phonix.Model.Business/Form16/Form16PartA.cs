
namespace Phoenix.Model.Business.Form16
{
    public class YearWiseTaxDocument
    {
        public YearWiseTaxDocument()
        {
            FinYear = string.Empty;
            Apex= string.Empty;
            Pan= string.Empty;
            FileName=string.Empty;
            FilePath=string.Empty;
        }
        public long EmpDocsSlno { get; set; }
        public int FinSlno { get; set; }
        public string FinYear { get; set; }
        public string Apex { get; set; }
        public string Pan { get; set; }
        public string FileName { get; set; }
        public string FilePath { get; set; }
        public long UserSlno { get; set; }

        public string PartId { get; set; }
    }

    public class TaxDocuments
    {
        public TaxDocuments()
        {
            YearWiseTaxDocuments = new List<YearWiseTaxDocument>();
        }
        public string FinYear { get; set; }
        public List<YearWiseTaxDocument> YearWiseTaxDocuments { get; set; }
    }
}
