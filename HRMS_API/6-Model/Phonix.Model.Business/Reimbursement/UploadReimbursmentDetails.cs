using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.Reimbursement
{
    public class UploadReimbursmentDetails
    {
        public string  BillNumber { get; set; }
        public DateTime BillDate { get; set; }
        public int? Amount { get; set; }
        public string? FilePath { get; set; }
        public FileToUpload? File { get; set; } 
        public int MonthSLNo { get; set; }
        public int PBranchSLNo { get; set; }
        public int EmpSLNo { get; set; }
        public int UniqueNo { get; set; }
        public int UserSLNo { get; set; }
        public int HeadSLNo { get; set; }
        public bool IsFileExist { get; set; }
    }
}
