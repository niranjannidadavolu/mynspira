using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.CarLease
{
    public class CarLeaseMaintenanceDetail
    {
        public int? MonthSLNo { get; set; }
        public int? PBranchSLNo { get; set; }
        public int? EmpSLNo { get; set; }
        public int? UniqueNo { get; set; }
        public int? UserSLNo { get; set; }
        public int? HeadSLNo { get; set; }
        public bool IsFileExist { get; set; }
        public FileToUpload File { get; set; }
        public int? EmpCarLeasedDTSLNo { get; set; }
        public string? BillName { get; set; }
        public int? MaxAmount { get; set; }
        public int? Amount { get; set; }
        public int? BillNo { get; set; }
        public string? FilePath { get; set; }
        public DateTime? BillDate { get; set; }
        public string? FileImage { get; set; }
        public int? CarLeaseSLno { get; set; }
    }
}
