using Phoenix.Model.Business.FileUpload;

namespace Phoenix.Model.Business.CarLease
{
    public class CarLeaseAgreementBills
    {
        public CarLeaseAgreementBills()
        {
            Salary_Voucher = string.Empty;
            MonthName = string.Empty;
            FilePath = string.Empty;
            Remarks = string.Empty;
        }

        public int EmpCarLeasedDTSLNo { get; set; }
        public string Salary_Voucher { get; set; }
        public string MonthName { get; set; }
        public int ToBePaid { get; set; }
        public int Paid { get; set; }
        public int Balance { get; set; }
        public int BillNo { get; set; }
        public DateTime? BillDate { get; set; }
        public FileToUpload FileData { get; set; }
        public string FileImage { get; set; }
        public string FilePath { get; set; }
        public string BillCopy { get; set; }
        public string BillCopyName { get; set; }
        public string Remarks { get; set; }
        public int IsApproved { get; set; }
        public int MonthSlNo { get; set; }
        public int EmployeeSlno { get; set; }
        public string ApprovalStatus
        {
            get
            {
                string approvalStatus = string.Empty;
                if (IsApproved == 0)
                {
                    approvalStatus = "PENDING";
                }
                else if (IsApproved == 1)
                {
                    approvalStatus = "APPROVED";
                }
                return approvalStatus;
            }
        }
    }
}
