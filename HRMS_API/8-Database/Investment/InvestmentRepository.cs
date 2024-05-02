using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Investment;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using Phoenix.CrossCutting.Helper;
using Phoenix.Model.Business.Employee;
using Phoenix.Database.Repository.Employee;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Phoenix.CrossCutting.Extension.System.Object.Casting;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phoenix.CrossCutting.Extension.System.String;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Database.Repository.Investment
{
    public class InvestmentRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;
        private readonly IDistributedCache redisCache;
        public InvestmentRepository(IConfiguration configuration, ILoggerManager logger) : base(configuration)
        {
            this.configuration = configuration;
            this.logger = logger;
        }

        #region Get Investment Declarations
        public async Task<InvestmentDeclaration> GetInvestmentDeclaration(int finSLNo, int employeeSLNo)
        {
            InvestmentDeclaration investmentDeclaration = new InvestmentDeclaration();
            var employeeDetails = await GetTDSEmpDetails(finSLNo, employeeSLNo);
            var tdsEmployeeHRADetails = await GetTDSEmpHRADetails(finSLNo, employeeSLNo);
            var tdsEmployeeSubHeadingDetails = await GetTDSEmpSubHeadDetails(finSLNo, employeeSLNo);
            var tdsEmployeeHouseIncomeDetails = await GetEmpHouseIncomeDetails(finSLNo, employeeSLNo);
            var employeeOtherIncomeDetails = await GetEmpOtherIncomeDetails(finSLNo, employeeSLNo);
            var employee80GDetails = await GetEmployee80GDetails(finSLNo, employeeSLNo);
            var employeeSection80G = await MapSection80GDetails(finSLNo, employeeSLNo);
            if (employeeDetails != null)
            {
                investmentDeclaration = new InvestmentDeclaration
                {
                    EmployeeTdsId = employeeDetails.TDSEmpSLNo,
                    EmployeeId = employeeDetails.EmployeeSLNo,
                    FinancialYearId = employeeDetails.FinSLNo,
                    UniqueNumber = employeeDetails.UniqueNo,
                    InvestmentDetail = MapInvestmentDetails(employeeDetails),
                    Chapter6Detail = MapChapter6Details(tdsEmployeeSubHeadingDetails.Where(x => x.SubHeadSLNo != 264).ToList()),
                    Section80GDetail = employeeSection80G,
                    HouseRentAllowance = MapHouseRentAllowence(employeeDetails, tdsEmployeeHRADetails),
                    HouseIncomeDetail = MapHouseIncomeDetails(tdsEmployeeHouseIncomeDetails),
                    OtherIncomeDetail = MapOtherIncomedetails(employeeOtherIncomeDetails)
                };
            }
            return investmentDeclaration;
        }
        public async Task<TaxDeductionDetails> GetIncomeTaxPaymentDetails(int employeeSLNo)
        {
            TaxDeductionDetails taxDeductionDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                string query = $"SELECT  F_TDSCALC_PORTAL_SELECT({employeeSLNo}) FROM DUAL";
                string response = await connection.ExecuteScalarAsync<dynamic>(query);
                if (response != null && response != String.Empty)
                {
                    string[] responseSplit = response.Split(new Char[] { ':' });
                    if (responseSplit.Length > 0)
                    {
                        taxDeductionDetails = new TaxDeductionDetails();
                        taxDeductionDetails.TdsForFinYear = responseSplit[0];
                        taxDeductionDetails.TdsDeductedTillNow = responseSplit[1];
                        taxDeductionDetails.BalanceTds = responseSplit[2];
                        taxDeductionDetails.BalanceTdsPerMonth = responseSplit[3];
                    }
                }

            }
            return taxDeductionDetails;
        }
        public async Task<List<AssessmentTypeDetails>> GetAssesseeTypeDetails()
        {
            List<AssessmentTypeDetails> assessmentTypeDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                assessmentTypeDetails = (await connection.QueryAsync<AssessmentTypeDetails>(CrossCutting.Resources.Investment.ASSESSEE_TYPE_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return assessmentTypeDetails;
        }
        public async Task<List<HRALocations>> GetHRALocations()
        {
            List<HRALocations> hRALocations = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                hRALocations = (await connection.QueryAsync<HRALocations>(CrossCutting.Resources.Investment.HRA_LOCATION_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return hRALocations;
        }


        private async Task<List<TdsEmployeeSection80G>> GetEmployee80GDetails(int finSLNo, int employeeSLNo)
        {
            List<TdsEmployeeSection80G> tdsEmployeeHRADetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parmeters.Add(name: "DATACUR1", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parmeters.Add(name: "DATACUR2", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                var results = await connection.QueryMultipleAsync(CrossCutting.Resources.Investment.TDS_EMP_80G_DETAILS, parmeters, commandType: CommandType.StoredProcedure);
                //employeeLeaves = results.Read<LeaveDetail>().ToList();
                var leaveWorkFlows = results.Read<LeaveWorkFlow>().ToList();
                tdsEmployeeHRADetails = (await connection.QueryAsync<TdsEmployeeSection80G>(CrossCutting.Resources.Investment.TDS_EMP_80G_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return tdsEmployeeHRADetails;
        }
        private async Task<EmployeeDetails> GetTDSEmpDetails(int finSLNo, int employeeSLNo)
        {
            EmployeeDetails tdsEmployeeDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                tdsEmployeeDetails = (await connection.QueryAsync<EmployeeDetails>(CrossCutting.Resources.Investment.TDS_EMP_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).FirstOrDefault();
            }

            return tdsEmployeeDetails;
        }
        private async Task<List<TdsEmployeeHRADetails>> GetTDSEmpHRADetails(int finSLNo, int employeeSLNo)
        {
            List<TdsEmployeeHRADetails> tdsEmployeeHRADetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                tdsEmployeeHRADetails = (await connection.QueryAsync<TdsEmployeeHRADetails>(CrossCutting.Resources.Investment.TDS_EMP_HRA_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            return tdsEmployeeHRADetails;
        }
        private async Task<List<TdsEmployeeSubHeadDetails>> GetTDSEmpSubHeadDetails(int finSLNo, int employeeSLNo)
        {
            List<TdsEmployeeSubHeadDetails> tdsEmployeeHRADetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                tdsEmployeeHRADetails = (await connection.QueryAsync<TdsEmployeeSubHeadDetails>(CrossCutting.Resources.Investment.EMP_TDS_SUBHEAD_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return tdsEmployeeHRADetails;
        }
        private async Task<List<EmployeeHouseIncomeDetail>> GetEmpHouseIncomeDetails(int finSLNo, int employeeSLNo)
        {
            List<EmployeeHouseIncomeDetail> tdsEmployeeHouseIncomeDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                tdsEmployeeHouseIncomeDetails = (await connection.QueryAsync<EmployeeHouseIncomeDetail>(CrossCutting.Resources.Investment.EMP_HOUSE_INCOME_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return tdsEmployeeHouseIncomeDetails;
        }
        private async Task<List<EmployeeOtherIncomeDetail>> GetEmpOtherIncomeDetails(int finSLNo, int employeeSLNo)
        {
            List<EmployeeOtherIncomeDetail> empOtherIncomeDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                empOtherIncomeDetails = (await connection.QueryAsync<EmployeeOtherIncomeDetail>(CrossCutting.Resources.Investment.EMP_OTHER_INCOME_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            return empOtherIncomeDetails;
        }

        private List<OtherIncomeDetail> MapOtherIncomedetails(List<EmployeeOtherIncomeDetail> employeeOtherIncomeDetails)
        {
            List<OtherIncomeDetail> OtherIncomeDetails = null;
            if (employeeOtherIncomeDetails != null)
            {
                OtherIncomeDetails = new List<OtherIncomeDetail>();
                foreach (var item in employeeOtherIncomeDetails)
                {
                    OtherIncomeDetail houseIncome = new OtherIncomeDetail
                    {
                        OtherIncomeDetailId = item.TdsEmpOISlNo,
                        Amount = item.Amount,
                        Description = item.Description,
                        OthIncomeHeadId = item.OthIncomeHeadSlNo,
                        TdsAmount = item.Tds_Amt,
                        VerifiedAmount = item.VerifiedAmount,
                        VerifiedRemarks = item.VerifiedRemarks,
                        FileCount = item.FileCount,
                        VerifiedUserSlNo = item.VerifiedUserSlNo
                    };
                    OtherIncomeDetails.Add(houseIncome);
                }
            }
            return OtherIncomeDetails;
        }
        private List<HousePropertyIncomeDetail> MapHouseIncomeDetails(List<EmployeeHouseIncomeDetail> employeeHouseIncomeDetails)
        {
            List<HousePropertyIncomeDetail> HousePropertyIncomeDetails = null;
            if (employeeHouseIncomeDetails != null)
            {
                HousePropertyIncomeDetails = new List<HousePropertyIncomeDetail>();
                foreach (EmployeeHouseIncomeDetail item in employeeHouseIncomeDetails)
                {
                    HousePropertyIncomeDetail houseIncome = new HousePropertyIncomeDetail
                    {
                        HouseIncomeDetailId = item.TdsEmpHISlNo,
                        Amount = item.Amount,
                        Description = item.Description,
                        HouseIncomeHeadId = item.HouseIncomeHeadSlNo,
                        PanNumber = item.HouseIncomeHeadSlNo == 3 ? (item.BANK_PANNO.IsNullOrEmpty() ? "PAN REQ" : item.BANK_PANNO) : "NO PAN",
                        VerifiedAmount = item.VerifiedAmount,
                        VerifiedRemarks = item.VerifiedRemarks,
                        FileCount = item.FileCount,
                        VerifiedUserSlNo = item.VerifiedUserSlNo,
                        IsPanVerified = item.isPanVerified,
                        VerifiedName = item.VerifiedName,
                        VerifiedPan = item.VerifiedPan
                    };
                    HousePropertyIncomeDetails.Add(houseIncome);
                }
            }
            return HousePropertyIncomeDetails;
        }
        private HouseRentAllowance MapHouseRentAllowence(EmployeeDetails employeeDetails, List<TdsEmployeeHRADetails> tdsEmployeeHRADetails)
        {
            HouseRentAllowance houseRentAllowance = new HouseRentAllowance
            {
                LocationId = employeeDetails.HRALocationSLNo,
                IsRentHouse = employeeDetails.IsRentHouse,
                StreetName = employeeDetails.Street_Vill,
                HouseNumber = employeeDetails.Hno,
                MandalId = employeeDetails.MandalSLNo,
                DistrictId = employeeDetails.DistrictSLNo,
                StateId = employeeDetails.StateSLNo,
                PhoneNumber = employeeDetails.PhoneNo,
                Pincode = employeeDetails.Pin
            };

            foreach (TdsEmployeeHRADetails item in tdsEmployeeHRADetails)
            {
                RentPayment rentPayment = new RentPayment
                {
                    RentPaymentId = item.TdsHraSLNo,
                    OwnerName = item.OwnerName,
                    OwnerPan = item.OwnerPan,
                    NoOfMonths = item.NoOfMonths,
                    Amount = item.Amount,
                    VerifiedAmount = item.VerifiedAmount,
                    VerifiedRemarks = item.VerifiedRemarks,
                    FileCount = item.FileCount,
                    IsPanVerified = item.isPanVerified,
                    VerifiedName = item.VerifiedName,
                    VerifiedPan = item.VerifiedPan
                };
                houseRentAllowance.RentPaymentDetails.Add(rentPayment);
            }
            return houseRentAllowance;
        }
        private async Task<EmployeeChapter6Detail> MapSection80GDetails(int finSLNo, int employeeSLNo)
        {
            EmployeeChapter6Detail section80G = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "iFINSLNO", finSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parmeters.Add(name: "DATACUR1", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                parmeters.Add(name: "DATACUR2", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                var results = await connection.QueryMultipleAsync(CrossCutting.Resources.Investment.TDS_EMP_80G_DETAILS, parmeters, commandType: CommandType.StoredProcedure);
                var employeeSection80G = results.Read<TdsEmployeeSection80G>().ToList().FirstOrDefault();
                var employeeSection80GDetails = results.Read<TdsEmployeeSection80GDetail>().ToList();
                var employeeSection80GFiles = results.Read<TdsEmployeeSection80GFile>().ToList();

                if (employeeSection80G != null)
                {
                    section80G = new EmployeeChapter6Detail
                    {
                        SectionName = employeeSection80G.SECTION1,
                        Chapter6DetailId = employeeSection80G.TDSEMPSHSLNO,
                        SubHeadId = employeeSection80G.SUBHEADSLNO,
                        Amount = employeeSection80G.AMOUNT,
                        VerifiedAmount = employeeSection80G.VERIFIEDAMOUNT,
                        VerifiedRemarks = employeeSection80G.VERIFIEDREMARKS,
                        VerifiedUserSlNo = employeeSection80G.VERIFIEDUSERSLNO,
                        FileCount = employeeSection80G.FileCount,
                        Particulars = employeeSection80G.PARTICULARS,
                        Section80GDetails = PopulateSection80GDetails(employeeSection80GDetails, employeeSection80GFiles, employeeSection80G),
                    };
                }

            }
            return section80G;
        }

        private List<Section80GDetail> PopulateSection80GDetails(
            List<TdsEmployeeSection80GDetail> employeeSection80GDetails,
            List<TdsEmployeeSection80GFile> employeeSection80GFiles, TdsEmployeeSection80G tdsEmployeeSection80G)
        {
            List<Section80GDetail> section80GDetails = null;
            section80GDetails = new List<Section80GDetail>();

            foreach (TdsEmployeeSection80GDetail item in employeeSection80GDetails)
            {
                Section80GDetail section80GDetail = new Section80GDetail
                {
                    Amount = item.Amount,
                    FileCount = item.FileCount,
                    EMPLOYEESLNO = item.EMPLOYEESLNO,
                    FINSLNO = item.FINSLNO,
                    EMPSLNO = item.EMPSLNO,
                    ORGSLNO = item.ORGSLNO,
                    ORG_NAME = item.ORG_NAME,
                    ORG_PAN = item.ORG_PAN,
                    TDS80GSLNO = item.TDS80GSLNO,
                    TDSEMPSLNO = item.TDSEMPSLNO,
                    TDSEMPSHSLNO = tdsEmployeeSection80G.TDSEMPSHSLNO,
                    UNIQUENO = item.UNIQUENO,
                    VerifiedAmount = item.VerifiedAmount,
                    VerifiedRemarks = item.VerifiedRemarks,
                    VerifiedUserSlNo = item.VerifiedUserSlNo,
                    IsPanVerified = item.IsPanVerified,
                    VerifiedName = item.VerifiedName,
                    VerifiedPan = item.VerifiedPan
                };

                TdsEmployeeSection80GFile fileDetails = employeeSection80GFiles.FirstOrDefault(x => x.TDS80GSLNO == item.TDS80GSLNO);
                if (fileDetails != null)
                {
                    Section80GFile file = new Section80GFile()
                    {
                        TDS80GSLNO = item.TDS80GSLNO,
                        TDS80GFILESLNO = fileDetails.TDS80GFILESLNO,
                        FILENAME = fileDetails.FILENAME,
                        FILENAME_ORIGINAL = fileDetails.FILENAME_ORIGINAL,
                        FILEPATH = fileDetails.FILEPATH,
                    };
                    section80GDetail.FileInfo = file;
                }
                section80GDetails.Add(section80GDetail);
            }
            return section80GDetails;
        }

        private List<EmployeeChapter6Detail> MapChapter6Details(List<TdsEmployeeSubHeadDetails> tdsEmployeeSubHeadingDetails)
        {
            List<EmployeeChapter6Detail> chapter6Details = null;
            if (tdsEmployeeSubHeadingDetails != null)
            {
                chapter6Details = new List<EmployeeChapter6Detail>();
                foreach (TdsEmployeeSubHeadDetails item in tdsEmployeeSubHeadingDetails)
                {
                    var itemDetail = new EmployeeChapter6Detail
                    {
                        SectionName = item.Section1,
                        Chapter6DetailId = item.TdsEmpSHSLNo,
                        SubHeadId = item.SubHeadSLNo,
                        Particulars = item.PARTICULARS,
                        Amount = item.Amount,
                        VerifiedAmount = item.VerifiedAmount,
                        VerifiedRemarks = item.VerifiedRemarks,
                        VerifiedUserSlNo = item.VerifiedUserSlNo,
                        FileCount = item.FileCount,
                        IsPanVerified = item.isPanVerified,
                        VerifiedName = item.VerifiedName,
                        VerifiedPan = item.VerifiedPan

                    };
                    chapter6Details.Add(itemDetail);
                }
            }
            return chapter6Details;
        }
        private List<EmployeeChapter6Detail> Get80GRecords(List<TdsEmployeeSubHeadDetails> tdsEmployeeSubHeadingDetails)
        {
            List<EmployeeChapter6Detail> chapter6Details = null;
            if (tdsEmployeeSubHeadingDetails != null)
            {
                chapter6Details = new List<EmployeeChapter6Detail>();
                foreach (var item in tdsEmployeeSubHeadingDetails)
                {
                    var itemDetail = new EmployeeChapter6Detail
                    {
                        SectionName = item.Section1,
                        Chapter6DetailId = item.TdsEmpSHSLNo,
                        SubHeadId = item.SubHeadSLNo,
                        Particulars = item.PARTICULARS,
                        Amount = item.Amount,
                        VerifiedAmount = item.VerifiedAmount,
                        VerifiedRemarks = item.VerifiedRemarks,
                        VerifiedUserSlNo = item.VerifiedUserSlNo,
                        FileCount = item.FileCount,
                        IsPanVerified = item.isPanVerified,
                        VerifiedName = item.VerifiedName,
                        VerifiedPan = item.VerifiedPan

                    };
                    chapter6Details.Add(itemDetail);
                }
            }
            return chapter6Details;
        }
        private List<EmployeeChapter6Detail> MapSection80GDetails(List<TdsEmployeeSubHeadDetails> tdsEmployeeSubHeadingDetails)
        {
            List<EmployeeChapter6Detail> chapter6Details = null;
            if (tdsEmployeeSubHeadingDetails != null)
            {
                chapter6Details = new List<EmployeeChapter6Detail>();
                foreach (var item in tdsEmployeeSubHeadingDetails)
                {
                    var itemDetail = new EmployeeChapter6Detail
                    {
                        SectionName = item.Section1,
                        Chapter6DetailId = item.TdsEmpSHSLNo,
                        SubHeadId = item.SubHeadSLNo,
                        Particulars = item.PARTICULARS,
                        Amount = item.Amount,
                        VerifiedAmount = item.VerifiedAmount,
                        VerifiedRemarks = item.VerifiedRemarks,
                        VerifiedUserSlNo = item.VerifiedUserSlNo,
                        FileCount = item.FileCount,
                        IsPanVerified = item.isPanVerified,
                        VerifiedName = item.VerifiedName,
                        VerifiedPan = item.VerifiedPan

                    };
                    chapter6Details.Add(itemDetail);
                }
            }
            return chapter6Details;
        }
        private InvestmentDetail MapInvestmentDetails(EmployeeDetails employeeDetails)
        {
            InvestmentDetail investmentDetail = new InvestmentDetail
            {
                AssesseeTypeId = employeeDetails.AssesseeTypeSLNo,
                Is_NewRegime = employeeDetails.Is_NewRegime,
                Is_Senior_Citizen = employeeDetails.Is_Senior_Citizen
            };
            return investmentDetail;
        }

        #endregion
        #region Verify Proofs
        private async Task<bool> VerifySection80GDetails(IDbConnection connection, InvestmentDeclaration investmentDeclaration, EmployeeChapter6Detail section80GDetail)
        {
            int savedRecords = 0;

            if (section80GDetail != null)
            {
                List<OracleDynamicParameters> parmeters = new();
                section80GDetail.Section80GDetails.ForEach(hr =>
                {
                    ConvertToUpparCase.StringToUpparCase(hr);
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDS80GSLNO", hr.TDS80GSLNO, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iORGSLNO", hr.ORGSLNO, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iEMPLOYEESLNO", hr.VerifiedUserSlNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iVERFIFIEDREMARKS", string.IsNullOrEmpty(hr.VerifiedRemarks) ? "PROOFS VERIFIED" : hr.VerifiedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iAMOUNT", hr.VerifiedAmount, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                    param.Add(name: "iIS_PAN_VERIFIED", hr.IsPanVerified, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iVERIFIED_PAN", hr.VerifiedPan, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iVERIFIED_NAME", hr.VerifiedName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(param);
                    savedRecords = savedRecords + connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_EMP_TDS_VERIFY_80G_DETAILS, param, commandType: CommandType.StoredProcedure).Result;

                });
            }
            return (savedRecords * -1) > 0;
        }
        private async Task<bool> VerifyOtherIncomeDetails(IDbConnection connection, InvestmentDeclaration investmentDeclaration, List<OtherIncomeDetail> otherIncomeDetails)
        {
            List<OracleDynamicParameters> parmeters = new();

            otherIncomeDetails.ForEach(otherIncome =>
            {
                OracleDynamicParameters param = new();
                param.Add(name: "IVERIFIEDAMOUNT", otherIncome.VerifiedAmount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IVERIFIEDREMARKS", string.IsNullOrEmpty(otherIncome.VerifiedRemarks) ? "PROOFS VERIFIED" : otherIncome.VerifiedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "IVERIFIEDUSERSLNO", investmentDeclaration.VerificationEmployeeSlno.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iTDSEMPOISLNO", otherIncome.OtherIncomeDetailId.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(param);
            });
            int savedRecords = await connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_TDS_VERIFY_OTHER_INCOME, parmeters, commandType: CommandType.StoredProcedure);
            return (savedRecords * -1) > 0;
        }
        private async Task<bool> VerifyHouseIncomeDetails(IDbConnection connection, InvestmentDeclaration investmentDeclaration, List<HousePropertyIncomeDetail> houseIncomeDetails)
        {
            List<OracleDynamicParameters> parmeters = new();
            int savedRecords = 0;
            houseIncomeDetails.ForEach(houseIncome =>
            {
                ConvertToUpparCase.StringToUpparCase(houseIncome);
                OracleDynamicParameters param = new();
                param.Add(name: "IVERIFIEDAMOUNT", houseIncome.VerifiedAmount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IVERIFIEDREMARKS", string.IsNullOrEmpty(houseIncome.VerifiedRemarks) ? "PROOFS VERIFIED" : houseIncome.VerifiedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "IVERIFIEDUSERSLNO", investmentDeclaration.VerificationEmployeeSlno.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iTDSEMPHISLNO", houseIncome.HouseIncomeDetailId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iIS_PAN_VERIFIED", houseIncome.IsPanVerified, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iVERIFIED_PAN", houseIncome.VerifiedPan, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iVERIFIED_NAME", houseIncome.VerifiedName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parmeters.Add(param);
                savedRecords = savedRecords + connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_TDS_VERIFY_HOUSE_INCOME, param, commandType: CommandType.StoredProcedure).Result;

            });
            return (savedRecords * -1) > 0;
        }
        private async Task<bool> VerifyChapter6Details(IDbConnection connection, InvestmentDeclaration investmentDeclaration, List<EmployeeChapter6Detail> chapter6Details)
        {
            int savedRecords = 0;
            List<OracleDynamicParameters> parmeters = new();

            chapter6Details.ForEach(sections =>
            {
                OracleDynamicParameters param = new();
                param.Add(name: "iVERIFIEDAMOUNT", sections.VerifiedAmount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IVERIFIEDREMARKS", string.IsNullOrEmpty(sections.VerifiedRemarks) ? "PROOFS VERIFIED" : sections.VerifiedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "IVERIFIEDUSERSLNO", investmentDeclaration.VerificationEmployeeSlno.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iTDSEMPSHSLNO", sections.Chapter6DetailId, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                param.Add(name: "iIS_PAN_VERIFIED", string.Empty, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iVERIFIED_PAN", string.Empty, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iVERIFIED_NAME", string.Empty, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parmeters.Add(param);
                savedRecords = savedRecords + connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_TDS_VERIFY_SUBHEAD_AMOUNT, parmeters, commandType: CommandType.StoredProcedure).Result;
            });

            return (savedRecords * -1) > 0;
        }
        private async Task<bool> VerifyRentPayments(IDbConnection connection, InvestmentDeclaration investmentDeclaration, List<RentPayment> rentPaymentDetails)
        {
            int savedRecords = 0;
            try
            {
                List<OracleDynamicParameters> parmeters = new();
                rentPaymentDetails.ForEach(hr =>
                {
                    ConvertToUpparCase.StringToUpparCase(hr);
                    OracleDynamicParameters param = new();
                    param.Add(name: "IVERIFIEDAMOUNT", hr.VerifiedAmount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "IVERIFIEDREMARKS", string.IsNullOrEmpty(hr.VerifiedRemarks) ? "PROOFS VERIFIED" : hr.VerifiedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "IVERIFIEDUSERSLNO", investmentDeclaration.VerificationEmployeeSlno.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iTDSHRASLNO", hr.RentPaymentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iIS_PAN_VERIFIED", hr.IsPanVerified, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iVERIFIED_PAN", hr.VerifiedPan, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iVERIFIED_NAME", hr.VerifiedName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(param);
                    savedRecords = savedRecords + connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_EMP_TDS_VERIFY_HRA_AMOUNT, param, commandType: CommandType.StoredProcedure).Result;


                });
                return (savedRecords * -1) > 0;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        #endregion
        #region update declarations 

        public async Task<InvestmentDeclaration> SaveInvestmentDeclarations(InvestmentDeclaration investmentDeclaration)
        {
            bool allDataSaved = false;
            InvestmentDeclaration savedInvestmentDeclaration = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                using (var tran = connection.BeginTransaction())
                {
                    if (investmentDeclaration != null && investmentDeclaration.IsVerified)
                    {
                        bool isRentPaymentSaved = await VerifyRentPayments(connection, investmentDeclaration, investmentDeclaration.HouseRentAllowance.RentPaymentDetails);
                        bool isChapter6DetailsSaved = await VerifyChapter6Details(connection, investmentDeclaration, investmentDeclaration.Chapter6Detail);
                        bool isHouseIncomeDetailsSaved = await VerifyHouseIncomeDetails(connection, investmentDeclaration, investmentDeclaration.HouseIncomeDetail);
                        bool isOtherIncomeDetailsSaved = await VerifyOtherIncomeDetails(connection, investmentDeclaration, investmentDeclaration.OtherIncomeDetail);
                        bool isSection80GSaved = await VerifySection80GDetails(connection, investmentDeclaration, investmentDeclaration.Section80GDetail);
                        bool isSection80GMasterSaved = await VerifySection80GMaster(connection, investmentDeclaration, investmentDeclaration.Section80GDetail);
                        allDataSaved = isRentPaymentSaved && isChapter6DetailsSaved && isHouseIncomeDetailsSaved && isOtherIncomeDetailsSaved && isSection80GSaved;
                        if (allDataSaved)
                        {
                            tran.Commit();
                            await VerifyProofsSendMessage(investmentDeclaration.EmployeeId);
                        }
                    }
                    else
                    {
                        investmentDeclaration.Section80GDetail.Amount = investmentDeclaration.Section80GDetail.Section80GDetails.Sum(X => X.Amount);
                        investmentDeclaration.Section80GDetail.VerifiedAmount = investmentDeclaration.Section80GDetail.Section80GDetails.Sum(X => X.VerifiedAmount);

                        investmentDeclaration.Chapter6Detail.Add(investmentDeclaration.Section80GDetail);
                        bool isInvestmentDetailsSaved = await SaveInvestmentDetails(connection, investmentDeclaration, investmentDeclaration.InvestmentDetail, investmentDeclaration.HouseRentAllowance);
                        bool isRentPaymentSaved = await SaveRentPayments(connection, investmentDeclaration, investmentDeclaration.HouseRentAllowance.RentPaymentDetails);
                        bool isChapter6DetailsSaved = await SaveChapter6Details(connection, investmentDeclaration.Chapter6Detail);
                        bool isHouseIncomeDetailsSaved = await SaveHouseIncomeDetails(connection, investmentDeclaration.HouseIncomeDetail);
                        bool isOtherIncomeDetailsSaved = await SaveOtherIncomeDetails(connection, investmentDeclaration.OtherIncomeDetail);
                        bool isSection80GSaved = await SaveSection80GDetails(connection, investmentDeclaration, investmentDeclaration.Section80GDetail);
                        allDataSaved = isInvestmentDetailsSaved && isRentPaymentSaved && isChapter6DetailsSaved && isHouseIncomeDetailsSaved && isOtherIncomeDetailsSaved && isSection80GSaved;
                        if (allDataSaved)
                        {
                            tran.Commit();
                        }
                    }

                }
            }
            if (allDataSaved)
            {
                savedInvestmentDeclaration = await GetInvestmentDeclaration(investmentDeclaration.FinancialYearId.ToInt32OrDefault(), investmentDeclaration.EmployeeId.ToInt32OrDefault());
            }

            return savedInvestmentDeclaration;
        }

        private async Task<bool> VerifySection80GMaster(IDbConnection connection, InvestmentDeclaration investmentDeclaration, EmployeeChapter6Detail section80GDetail)
        {
            int savedRecords  = 0;
            if (section80GDetail != null && section80GDetail.Section80GDetails != null)
            {
                decimal totalSum = section80GDetail.Section80GDetails
                    .Where(x => x.IsPanVerified.ToStringOrDefault().ToUpper() == "VERIFIED").Sum(x => x.VerifiedAmount);

                int userSlno = section80GDetail.Section80GDetails
                    .Where(x => x.VerifiedUserSlNo.ToStringOrDefault() != null).Max(x => x.VerifiedUserSlNo);
                Section80GDetail section80GInformation =
                    section80GDetail.Section80GDetails.FirstOrDefault(x => x.TDSEMPSHSLNO != 0);
                if (section80GInformation != null)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDSEMPSHSLNO", section80GInformation.TDSEMPSHSLNO,
                        dbType: OracleMappingType.Int32,
                        direction: ParameterDirection.Input);
                    param.Add(name: "iVERIFIEDAMOUNT", totalSum, dbType: OracleMappingType.Int32,
                        direction: ParameterDirection.Input);
                    param.Add(name: "iVERIFIEDREMARKS", "PROOFS VERIFIED", dbType: OracleMappingType.Varchar2,
                        direction: ParameterDirection.Input);
                    param.Add(name: "iUPDATEDBY", userSlno, dbType: OracleMappingType.Int32,
                        direction: ParameterDirection.Input);
                    savedRecords = connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_SECTION_80G_UPDATE, param, commandType: CommandType.StoredProcedure).Result;
                }
            }

            return savedRecords > 0;
        }

        private async Task<bool> SaveSection80GDetails(IDbConnection connection, InvestmentDeclaration investmentDeclaration, EmployeeChapter6Detail section80GDetail)
        {
            int savedRecords = 0;

            if (section80GDetail != null)
            {
                List<OracleDynamicParameters> parmeters = new();
                section80GDetail.Section80GDetails.ForEach(hr =>
                {
                    ConvertToUpparCase.StringToUpparCase(hr);
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDS80GSLNO", hr.TDS80GSLNO, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iORGSLNO", hr.ORGSLNO.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iORG_NAME", hr.ORG_NAME, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iORG_PAN", hr.ORG_PAN, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iAMOUNT", hr.Amount, dbType: OracleMappingType.Decimal, direction: ParameterDirection.Input);
                    parmeters.Add(param);

                });
                savedRecords = await connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_EMP_TDS_UPDATE_80G_DETAILS, parmeters, commandType: CommandType.StoredProcedure);
            }
            return (savedRecords * -1) > 0;
        }


        private async Task<bool> SaveOtherIncomeDetails(IDbConnection connection, List<OtherIncomeDetail> otherIncomeDetails)
        {
            List<OracleDynamicParameters> parmeters = new();

            otherIncomeDetails.ForEach(otherIncome =>
            {
                OracleDynamicParameters param = new();
                param.Add(name: "iOTHINCOMEHEADSLNO", otherIncome.OthIncomeHeadId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iAMOUNT", otherIncome.Amount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iTDSAMOUNT", otherIncome.TdsAmount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iTDSEMPOISLNO", otherIncome.OtherIncomeDetailId.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(param);
            });
            int savedRecords = await connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_EMP_TDS_UPDATEOTHERINCOME, parmeters, commandType: CommandType.StoredProcedure);
            return (savedRecords * -1) > 0;
        }

        private async Task<bool> SaveHouseIncomeDetails(IDbConnection connection, List<HousePropertyIncomeDetail> houseIncomeDetails)
        {
            List<OracleDynamicParameters> parmeters = new();

            houseIncomeDetails.ForEach(houseIncome =>
            {
                ConvertToUpparCase.StringToUpparCase(houseIncome);
                OracleDynamicParameters param = new();
                param.Add(name: "iAMOUNT", houseIncome.Amount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iHOUSEINCOMEHEADSLNO", houseIncome.HouseIncomeHeadId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iBANK_PANNO", houseIncome.PanNumber, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iTDSEMPHISLNO", houseIncome.HouseIncomeDetailId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(param);
            });
            int savedRecords = await connection.ExecuteAsync("SP_EMP_TDS_UpdateHouseIncome", parmeters, commandType: CommandType.StoredProcedure);
            return (savedRecords * -1) > 0;
        }

        private async Task<bool> SaveChapter6Details(IDbConnection connection, List<EmployeeChapter6Detail> chapter6Details)
        {
            List<OracleDynamicParameters> parmeters = new();

            chapter6Details.ForEach(sections =>
            {
                OracleDynamicParameters param = new();
                param.Add(name: "iAMOUNT", sections.Amount.ToInt64OrDefault(), dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                param.Add(name: "iSUBHEADSLNO", sections.SubHeadId, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                param.Add(name: "iTDSEMPSHSLNO", sections.Chapter6DetailId, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                parmeters.Add(param);
            });
            int savedRecords = await connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_EMP_TDS_UPDATESECSUBHEADS, parmeters, commandType: CommandType.StoredProcedure);
            return (savedRecords * -1) > 0;
        }

        private async Task<bool> SaveRentPayments(IDbConnection connection, InvestmentDeclaration investmentDeclaration, List<RentPayment> rentPaymentDetails)
        {
            List<OracleDynamicParameters> parmeters = new();
            rentPaymentDetails.ForEach(hr =>
            {
                ConvertToUpparCase.StringToUpparCase(hr);
                OracleDynamicParameters param = new();
                param.Add(name: "iOWNERNAME", hr.OwnerName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iOWNERPAN", hr.OwnerPan, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iAMOUNT", hr.Amount.ToInt64OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iNOOFMONTHS", hr.NoOfMonths, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "iUSERSLNO", investmentDeclaration.EmployeeId, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                param.Add(name: "iTDSHRASLNO", hr.RentPaymentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(param);

            });
            int savedRecords = await connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_EMP_TDS_UPDATEHRADETAILS, parmeters, commandType: CommandType.StoredProcedure);
            return (savedRecords * -1) > 0;
        }

        private async Task<bool> SaveInvestmentDetails(IDbConnection connection, InvestmentDeclaration investmentDeclaration, InvestmentDetail investmentDetail, HouseRentAllowance houseRentAllowance)
        {

            ConvertToUpparCase.StringToUpparCase(houseRentAllowance);
            OracleDynamicParameters parmeters = new();
            parmeters.Add(name: "iASSESSEETYPESLNO", investmentDetail.AssesseeTypeId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iIS_NEWREGIME", investmentDetail.Is_NewRegime, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iIS_SENIOR_CITIZEN", investmentDetail.Is_Senior_Citizen, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iISRENTHOUSE", houseRentAllowance.IsRentHouse, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iHRALOCATIONSLNO", houseRentAllowance.LocationId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iHNO", houseRentAllowance.HouseNumber, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
            parmeters.Add(name: "iSTREET_VILL", houseRentAllowance.StreetName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
            parmeters.Add(name: "iMANDALSLNO", houseRentAllowance.MandalId == 0 ? null : houseRentAllowance.MandalId.ToNullableInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iDISTRICTSLNO", houseRentAllowance.DistrictId == 0 ? null : houseRentAllowance.DistrictId.ToNullableInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iSTATESLNO", houseRentAllowance.StateId == 0 ? null : houseRentAllowance.StateId.ToNullableInt32OrDefault(), dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            parmeters.Add(name: "iPIN", houseRentAllowance.Pincode, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
            parmeters.Add(name: "iPHONENO", houseRentAllowance.PhoneNumber, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
            parmeters.Add(name: "iTDSEMPSLNO", investmentDeclaration.EmployeeTdsId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
            int savedRecords = await connection.ExecuteAsync(CrossCutting.Resources.Investment.SP_EMP_TDS_UPDATEEMPDETAILS, parmeters, commandType: CommandType.StoredProcedure);
            return (savedRecords * -1) > 0;
        }
        #endregion update declarations


        #region get declarations of employee


        #endregion
        public async Task VerifyProofsSendMessage(long EmployeeLSNO)
        {
            string VerifyMessage = string.Empty;
            string VerifyProofsValue = string.Empty;
            string VerifyProofsMessage = ApplicationSettings.Current.VerifyProofsMessage;
            string templateid = ApplicationSettings.Current.VerifyProofsTemplate;
            if (!string.IsNullOrEmpty(VerifyProofsMessage))
            {
                using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
                {
                    EmployeeProfile employeeProfile = await GetEmployeeMinimalProfile(EmployeeLSNO.ToInt32());
                    this.logger.LogInfo(VerifyProofsMessage);
                    this.logger.LogInfo(templateid);
                    this.logger.LogInfo(employeeProfile.EmployeeName);
                    if (employeeProfile.EmployeeName.Length > 28)
                    {
                        VerifyMessage = string.Format(VerifyProofsMessage, Environment.NewLine, employeeProfile.EmployeeName.Substring(0, 28));
                    }
                    else
                    {
                        VerifyMessage = string.Format(VerifyProofsMessage, Environment.NewLine, employeeProfile.EmployeeName);
                    }
                    OracleDynamicParameters parmeters = new OracleDynamicParameters();
                    parmeters.Add(name: "iMOBILENUMBER", employeeProfile.Mobile, dbType: OracleMappingType.Int64, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iMESSAGE", VerifyMessage, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iMESSAGESOURCESLNO", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iOFFICETYPESLNO", 1, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iSENDER", "NGROUP", dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parmeters.Add(name: "iTRAITEMPLATEID", templateid, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    await connection.ExecuteAsync(SMS_WhatsApp.SEND_SMS, parmeters, commandType: CommandType.StoredProcedure);
                }
            }
        }

        private async Task<EmployeeProfile> GetEmployeeMinimalProfile(int employeeSlno)
        {
            EmployeeProfile employeeProfile = null;
            using (EmployeeInformationRepository profileRepository = new EmployeeInformationRepository(configuration, this.redisCache))
            {
                employeeProfile = await profileRepository.GetEmployeeMinimumProfile(employeeSlno);
            }
            return employeeProfile;
        }
    }
}
