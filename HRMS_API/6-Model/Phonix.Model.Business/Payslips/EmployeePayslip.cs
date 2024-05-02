
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Model.Business.Payslips
{
    public class EmployeePayslip
    {
        public EmployeePayslip()
        {

        }
        public int Year { get; set; }
        public List<Payslip> Payslips { get; set; }
    }
    public class Payslip
    {
        public Payslip()
        {
            EmpId = string.Empty;
            EmployeeName = string.Empty;
            BranchName = string.Empty;
            Department = string.Empty;
            Designation = string.Empty;
            MonthName = string.Empty;
            Bank = string.Empty;
            AccountNo = string.Empty;
            AccBranch = string.Empty;
            IFSC = string.Empty;
            FILENO = string.Empty;
        }
        public long Slno { get; set; }
        public string EmpId { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeName { get; set; }
        public string BranchName { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string MonthName { get; set; }
        
        public long? Salary { get; set; }
        public long? NetPay { get; set; }
        public string Bank { get; set; }
        public string AccountNo { get; set; }
        public string AccBranch { get; set; }
        public string IFSC { get; set; }
        public string FILENO { get; set; }
        public int Year
        {
            get
            {
                int paySlipYear = 0;
                string[] paySlipYearData = MonthName.Split('-');
                if(paySlipYearData != null && paySlipYearData.Length > 1)
                {
                    paySlipYear = paySlipYearData[1].ToInt32OrDefault();
                }
                return paySlipYear;
            }
        }
        public string DisplayMonthName
        {
            get
            {
                string monthName = string.Empty;
                string[] paySlipYearData = MonthName.Split('-');
                if (paySlipYearData != null && paySlipYearData.Length > 1)
                {
                    monthName = paySlipYearData[0].Substring(0, 3).ToUpper();
                }
                return monthName;
            }
        }
    }
}
