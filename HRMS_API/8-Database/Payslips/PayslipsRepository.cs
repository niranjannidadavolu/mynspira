using Dapper;
using Dapper.Oracle;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Reporting.NETCore;
using Microsoft.SqlServer.Server;
using Phoenix.CrossCutting.Resources;
using Phoenix.Database.Repository.Reports;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Payslips;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Payslips
{
    /// <summary>
    /// Payslips Repository
    /// </summary>
    public class PayslipsRepository: BaseRepository
    {
        private readonly IConfiguration configuration;
        public PayslipsRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        /// <summary>
        /// Get Employee Payslip
        /// </summary>
        /// <param name="report"></param>
        /// <param name="employeeSlno"></param>
        /// <returns></returns>
        public async Task<byte[]> DownloadPaySlip(int employeeSlno)
        {           
            List<EmployeePayslipDetail> payslips = new List<EmployeePayslipDetail>();

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iSALACSLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                payslips = (await connection.QueryAsync<EmployeePayslipDetail>(DatabaseProcedures.DOWNLOAD_PAYSLIP, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            using var report = new LocalReport();
            await GetEmployPaySlipDataSet(report, payslips);
            var pdf = report.Render("pdf");
            return pdf;
        }      

        public async Task<List<Payslip>> GetEmployeePayslip(string employeeSlno)
        {
            List<EmployeePayslip> employeePayslips = null;
            List<Payslip> payslips = null;
            
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                payslips = (await connection.QueryAsync<Payslip>(DatabaseProcedures.GET_EMP_PAYSLIPS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return payslips;
        }

        /// <summary>
        /// Get Employ PaySlip DataSet
        /// </summary>
        /// <param name="report"></param>
        /// <param name="payslips"></param>
        /// <returns></returns>
        private async Task GetEmployPaySlipDataSet(LocalReport report,List<EmployeePayslipDetail> payslips)
        {
            EmpPsDs employPaySlipDataSet = new EmpPsDs();
            DataRow drPaySlipDetails = employPaySlipDataSet.Tables[0].NewRow();
            string path = "";
            if (payslips[0] != null)
            {
                var item = payslips[0];
                drPaySlipDetails["ACCOUNTNO"] = item.AccountNo;
                drPaySlipDetails["ADVANCES"] = item.Advances.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["AMTINWORDS"] = item.AmtInWords;
                drPaySlipDetails["BASIC"] = item.Basic.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["CTC_GROSSSALARY"] = item.CTC_GrossSalary.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["DA"] = item.DA.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["DEDUCATIONTOTAL"] = item.DeducationTotal.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["DEPARTMENT"] = item.Department;
                drPaySlipDetails["DESIGNATION"] = item.Designation;
                DateTime dateTime = DateTime.ParseExact(item.DOJ, "d/M/yyyy", CultureInfo.InvariantCulture);
                string DOJ = dateTime.ToString("dd/MMM/yyyy").ToUpper(); 
                drPaySlipDetails["DOJ"] = DOJ; 
                drPaySlipDetails["EMPLOYEENAME"] = item.EmployeeName;
                drPaySlipDetails["EMPLOYERESI"] = item.EmployerESI.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["EMPLOYERPF"] = item.EmployerPF.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["EARNINGTOTAL"] = item.EarningTotal.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["EMPNO"] = item.EMPNo;
                drPaySlipDetails["ESI"] = item.ESI.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["ESINO"] = item.ESINo == null ? 0 : item.ESINo;
                drPaySlipDetails["FOOD_COUPONS"] = item.Food_Coupons.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["GENDER"] = item.Gender;
                drPaySlipDetails["GMC"] = item.GMC.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["GROSSSALARY"] = item.GrossSalary.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["HRA"] = item.HRA.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["LEGBRANCHSLNO"] = item.LEGBranchSlno;
                drPaySlipDetails["LEGNAME"] = item.LEGName;
                drPaySlipDetails["LEGDESCRIPTION"] = item.LEGName;
                drPaySlipDetails["LOPDAYS"] = item.LOPDays;
                drPaySlipDetails["MISCAMT"] = item.MISCAmt.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["MONTHNAME"] = item.MonthName;
                drPaySlipDetails["NDAYS"] = item.NDays;
                drPaySlipDetails["OTHERALLOWANCE"] = item.OtherAllowance;
                drPaySlipDetails["PANNO"] = item.PANNo;
                drPaySlipDetails["PF"] = item.PF.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["PFNO"] = item.PFNo == null ? 0 : item.PFNo;
                drPaySlipDetails["PHAMT"] = item.PHAmt.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["PRESENTDAYS"] = item.PresentDays;
                drPaySlipDetails["PT"] = item.PT.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["REIMBURSEMENT"] = item.Reimbursement.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["ROUNDEDNET"] = item.RoundedNet.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["SDATE"] = item.SDate;
                drPaySlipDetails["TDS"] = item.TDS.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["SINCERITY_FUND"] = item.SincerityFund.ToInt32OrDefault().ToString("F");
                drPaySlipDetails["IS_SINCERITY_FUND"] = item.IsSincerityFund.ToBooleanOrDefault();


                //path = "Phoenix.Database.Repository.Reports.PayslipEmp.rdlc";

                if (payslips != null && payslips.Count > 0 && payslips[0].LEGBranchSlno == 4)
                {
                    path = "Phoenix.Database.Repository.Reports.PayslipNES.rdlc";
                    drPaySlipDetails["IMAGEURL"] =  "Phoenix.Database.Repository.Reports.Images.NES.jpg";
                }
                else if (payslips != null && payslips.Count > 0 && payslips[0].LEGBranchSlno == 18)
                {
                    drPaySlipDetails["IMAGEURL"] = "Phoenix.Database.Repository.Reports.Images.NspiraLogo.jpg";
                    path = "Phoenix.Database.Repository.Reports.PayslipEmp.rdlc";
                }
                else if (payslips != null && payslips.Count > 0)
                {
                    path = "Phoenix.Database.Repository.Reports.PayslipNES.rdlc";
                    drPaySlipDetails["IMAGEURL"] = "Phoenix.Database.Repository.Reports.Images.NES.jpg";
                }
            }
            employPaySlipDataSet.Tables[0].Rows.InsertAt(drPaySlipDetails, 0);

            ReportDataSource rds = new ReportDataSource();
            rds.Name = "EmpPsDs";
            rds.Value = employPaySlipDataSet.Tables[0];

            using var rs = Assembly.GetExecutingAssembly().GetManifestResourceStream(path);
            report.EnableExternalImages = true;
            report.LoadReportDefinition(rs);
            report.DataSources.Add(rds);
        }
    }
}
