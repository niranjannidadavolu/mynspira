using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.InvestmentProofs
{

    /// <summary>
    /// Chapter6FileDetails
    /// </summary>
    public class Chapter6FileDetails
    {
        public int  TdsEmpSHFileSLNo   { get; set; }
        public int TdsEmpSHSLNo  { get; set; }
        public string FileName { get; set; }
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }
        public bool Status { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
