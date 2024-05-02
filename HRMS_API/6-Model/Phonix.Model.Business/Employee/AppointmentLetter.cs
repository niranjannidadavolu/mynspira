using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal;
using Phoenix.CrossCutting.Extension.System.String;

namespace Phoenix.Model.Business.Employee
{
    public class AppointmentLetter
    {
        public string LetterId { get; set; }
        public int EmployeeSlno { get; set; }
        public int EmpSlno { get; set; }
        public string EmployeeId { get; set; }
        public DateTime AppointmentDate { get; set; }
        public string EmployeeName { get; set; }
        public string EmployeeNumber { get; set; }
        public string Designation { get; set; }
        public DateTime EffectiveFromDate { get; set; }
        public int LegalBranchSlno { get; set; }
        public string LegalBranchName { get; set; }

        public decimal GrossSalary { get; set; }
        public decimal MonthBasic { get; set; }
        public decimal MonthHra { get; set; }
        public decimal MonthDa { get; set; }
        public decimal MonthOtherA { get; set; }
        public decimal MonthEPF { get; set; }
        public decimal MonthEESI { get; set; }
        public decimal MonthTotal { get; set; }

        public decimal YearBasic { get; set; }
        public decimal YearHra { get; set; }
        public decimal YearDa { get; set; }
        public decimal YearOtherA { get; set; }
        public decimal YearEPF { get; set; }
        public decimal YearEESI { get; set; }
        public decimal YearTotal { get; set; }
        public string AppointmentNumber { get; set; }
        public bool IsSincerityFund { get; set; }

        public Dictionary<string, object> MyFormFields
        {
            get
            {
                Dictionary<string, object> formFileds = new Dictionary<string, object>();
                formFileds.Add("txtAppointmentLetterId", AppointmentNumber);
                formFileds.Add("txtAppointmentDate", AppointmentDate.ToString("dd-MMM-yyyy"));
                formFileds.Add("txtEmployeeName", EmployeeName);
                formFileds.Add("txtSignEmployeeName", EmployeeName);
                formFileds.Add("txtAckEmployeeName", EmployeeName);
                formFileds.Add("txtWelEmployeeName", EmployeeName);
                formFileds.Add("txtAckDate", AppointmentDate.ToString("dd-MMM-yyyy"));
                formFileds.Add("txtEmployeeId", EmployeeNumber);
                formFileds.Add("txtDesignation", Designation);
                formFileds.Add("txtEffectiveDate", AppointmentDate.ToString("dd-MMM-yyyy"));
                formFileds.Add("txtGrossSalary", GrossSalary.ToString("#,##0.00"));
                formFileds.Add("txtSalaryInWords", GrossSalary.ConvertCurrencyToWords().ToTitleCase());
                formFileds.Add("txtPMBasicSalary", MonthBasic.ToString("#,##0.00"));
                formFileds.Add("txtPMHRA", MonthHra.ToString("#,##0.00"));
                formFileds.Add("txtPMDA", MonthDa.ToString("#,##0.00"));
                formFileds.Add("txtPMOA", MonthOtherA.ToString("#,##0.00"));
                formFileds.Add("txtPMEPF", MonthEPF.ToString("#,##0.00"));
                formFileds.Add("txtPMEESI", MonthEESI.ToString("#,##0.00"));
                formFileds.Add("txtPMTOTAL", MonthTotal.ToString("#,##0.00"));
                formFileds.Add("txtYBaisc", YearBasic.ToString("#,##0.00"));
                formFileds.Add("txtYHRA", YearHra.ToString("#,##0.00"));
                formFileds.Add("txtYDA", YearDa.ToString("#,##0.00"));
                formFileds.Add("txtYOA", YearOtherA.ToString("#,##0.00"));
                formFileds.Add("txtYEPF", YearEPF.ToString("#,##0.00"));
                formFileds.Add("txtYEESI", YearEESI.ToString("#,##0.00"));
                formFileds.Add("txtYTOTAL", YearTotal.ToString("#,##0.00"));
                formFileds.Add("txtYTOTAL1", YearTotal.ToString("#,##0.00"));
                return formFileds;
            }
        }



    }
}
