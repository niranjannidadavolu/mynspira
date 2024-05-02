using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.InvestmentProofs
{

    /// <summary>
    /// HouseIncomeFileDetails
    /// </summary>
    public class HouseIncomeFileDetails
    {
        public int TdsEmpHIFileSLNo   { get; set; }
        public int TdsEmpHISLNo { get; set; }
        public string FileName { get; set; }
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }
        public bool Status { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
