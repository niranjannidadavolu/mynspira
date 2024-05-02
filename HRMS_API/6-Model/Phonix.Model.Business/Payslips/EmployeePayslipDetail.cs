using Phoenix.CrossCutting.Extension.System.Double;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Model.Business.Payslips
{
    public class EmployeePayslipDetail
    {
        public EmployeePayslipDetail()
        {
            EmployeeName = string.Empty;
            Gender = string.Empty;
            PANNo = string.Empty;
            AccountNo = string.Empty;
            EMPNo = string.Empty;
            DOJ = string.Empty;
            Department = string.Empty;
            Designation = string.Empty;
            MonthName = string.Empty;
            LEGName = string.Empty;
            SDate = string.Empty;            
        }
        public int Slno { get; set; }
        public string EmployeeName { get; set; }
        public string Gender { get; set; }
        public decimal PresentDays { get; set; }
        public decimal NDays { get; set; }
        public decimal LOPDays { get; set; }
        public long? PFNo { get; set; }
        public long? ESINo { get; set; }
        public string PANNo { get; set; }
        public string AccountNo { get; set; }
        public string EMPNo { get; set; }
        public string DOJ { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public decimal? CTC_GrossSalary { get; set; }
        public decimal? GrossSalary { get; set; }
        public int? Basic { get; set; }
        public int? DA { get; set; }
        public int? HRA { get; set; }
        public decimal? OtherAllowance { get; set; }
        public decimal? EmployerPF { get; set; }
        public decimal? EmployerESI { get; set; }
        public decimal? EarningTotal { get; set; }
        public decimal? PT { get; set; }
        public decimal? PF { get; set; }
        public decimal? ESI { get; set; }
        public decimal? TDS { get; set; }
        public decimal? Advances { get; set; }
        public decimal? PHAmt { get; set; }
        public decimal? GMC { get; set; }
        public decimal? Food_Coupons { get; set; }
        public decimal? MISCAmt { get; set; }
        public decimal? DeducationTotal { get; set; }
        public decimal? RoundedNet { get; set; }
        public string MonthName { get; set; }
        public string LEGName { get; set; }
        public string LegalEntity { get; set; }

        public string SDate { get; set; }        
        public int LEGBranchSlno { get; set; }
        public int Reimbursement { get; set; }
        public string AmtInWords
        { 
            get
            {
                double netSalary = RoundedNet.ToDoubleOrDefault();
                string amountInWords = netSalary.ToIndianRupees();
                return amountInWords;
            }
        }

        public decimal? SincerityFund { get; set; }
        public bool IsSincerityFund { get; set; }

    }
}
