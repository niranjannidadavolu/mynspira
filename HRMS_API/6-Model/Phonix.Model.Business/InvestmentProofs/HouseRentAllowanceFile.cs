using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.InvestmentProofs
{
    /// <summary>
    /// HouseRentAllowanceFile
    /// </summary>
    public class HouseRentAllowanceFile
    {
        public int TdsHRAFileSLNo  { get; set; }
        public int TdsHRASLNo  { get; set; }
        public string FileName { get; set; }
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }
        public bool Status { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
