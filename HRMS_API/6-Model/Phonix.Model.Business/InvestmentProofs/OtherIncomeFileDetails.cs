using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.InvestmentProofs
{

    /// <summary>
    /// OtherIncomeFileDetails
    /// </summary>
    public class OtherIncomeFileDetails
    {
        public int TdsEmpOIFileSLNo  { get; set; }
        public int TdsEmpOISLNo { get; set; }
        public string FileName { get; set; }
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }
        public bool Status { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
