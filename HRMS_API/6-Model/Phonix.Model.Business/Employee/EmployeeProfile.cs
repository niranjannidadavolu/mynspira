
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.Attendance;
using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.Employee
{
    public class EmployeeProfile : BaseBusinessEntity
    {
        public EmployeeProfile()
        {
            EmployeeEducationDetails = new();
            EmployeeFamilyDetails = new();
            EmployeeExperienceDetails = new();
            EmployeeAddressDetails = new();
            EmployeeAssetDetails = new();
            EmployeeId = string.Empty;
            EmployeeName = string.Empty;
            FatherName = string.Empty;
            //Dob = string.Empty;
            //Doj = string.Empty;
            Category = string.Empty;
            SubCategory = string.Empty;
            Department = string.Empty;
            Designation = string.Empty;
            BranchName = string.Empty;
            Bank = string.Empty;
            PersonalEmail = string.Empty;
            WorkEmail = string.Empty;
            PANNo = string.Empty;
            AccountNo = string.Empty;
            AccBranch = string.Empty;
            IFSC = string.Empty;
            BankInfoPath = string.Empty;
            PhotoPath = string.Empty;
            AadharPath = string.Empty;
            BIO_MATRIC_REG_NO = string.Empty;
        }

        public int? CategorySlno { get; set; }
        public int Slno { get; set; }
        public string EmployeeId { get; set; }
        public string EmpId { get; set; }
        public string CustomizedId { get; set; }
        public int BioMatricRegNo { get; set; }
        public int EmployeeSlno { get; set; }
        public int EmpSLNo { get; set; }
        public string EmployeeName { get; set; }
        public string FatherName { get; set; }
        public DateTime Dob { get; set; }
        public DateTime Doj { get; set; }
        public DateTime? ResignationDate { get; set; }
        public string Category { get; set; }
        public string SubCategory { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string BranchName { get; set; }
        public string Bank { get; set; }
        public long Mobile { get; set; }
        public string PersonalEmail { get; set; }
        public string WorkEmail { get; set; }
        public long? AadharNo { get; set; }
        public long? PFUANNo { get; set; }
        public long? ESINo { get; set; }
        public string PANNo { get; set; }
        public string AccountNo { get; set; }
        public string AccBranch { get; set; }
        public string IFSC { get; set; }
        public string BankInfoPath { get; set; }
        public string PhotoPath { get; set; }
        public string AadharPath { get; set; }
        public List<EducationDetail> EmployeeEducationDetails { get; set; }
        public List<FamilyDetail> EmployeeFamilyDetails { get; set; }
        public List<ExperienceDetail> EmployeeExperienceDetails { get; set; }
        public List<AddressDetail> EmployeeAddressDetails { get; set; }
        public List<AssetDetail> EmployeeAssetDetails { get; set; }

        public List<ReportingStructure> ReportingStructure { get; set; }
        public string EmployeePhoto { get; private set; }
        public List<BioMetric> EmployeeAttendance { get; set; }
        public string BIO_MATRIC_REG_NO { get; set; }
        public long FinSLNo { get; set; }
        public string EmpNo { get; set; }
        public long GrossSalary { get; set; }
        public long UniqueNo { get; set; }
        public long PBranchSLNo { get; set; }
        public bool IsCarLease { get; set; }
        public bool Is_Reimbursement { get; set; }

        public AddressDetail EmployeeAddress
        {
            get
            {
                AddressDetail address = new AddressDetail();
                address = EmployeeAddressDetails.FirstOrDefault();
                return address == null ? new AddressDetail() : address;
            }
        }

        public string PhotoBinary { get; set; }
        public string BankBinary { get; set; }
        public string AadharBinary { get; set; }

        public int PortalEmployeeId { get; set; }
        public int ReporteeCount { get; set; }
        public int ReportingManagerEmployeeSlno { get; set; }
        public int ReportingManagerId { get; set; }
        public string ReportingManagerName { get; set; }

        public bool IsApplicable { get; set; } //Added by Sudeer
        public EmployeeProfile HrDetails { get; set; }
        public int LevelCount { get; set; }
        public bool CanApplyLeave { get; set; }

        public int OfficeTypeSlno { get; set; }
        public string OfficeTypeName { get; set; }
        public DateTime PayrollMonthFrom { get; set; }
        public DateTime PayrollMonthTo { get; set; }

        public int CarLeaseAmount { get; set; }
        public decimal TotalSalary
        {
            get
            {
                decimal totalSalary = 0;
                if (EmpStatus == 1)
                {
                    totalSalary = 0;
                }
                else
                {
                    totalSalary = GrossSalary + CarLeaseAmount;
                }
                return totalSalary;
            }
        }
        public decimal BasicSalary
        {
            get
            {
                decimal basicSalary = 0;
                basicSalary = TotalSalary/2;
                return basicSalary;

            }
        }
        public decimal DaySalary
        {
            get
            {
                decimal daySalary = 0;
                daySalary = BasicSalary / 30;
                return daySalary;

            }
        }

        public int DepartmentSlno { get; set; }
        public int DesignationSlno { get; set; }
        public bool IsFresher { get; set; }

        public string EqualGateWay
        {
            get
            {
                string equalGateWay;
                //FOR DRIVER DESIGNATION
                if (DesignationSlno == 24)
                {
                    equalGateWay = EqualSettings.Current.Driver;
                }
                else
                {
                    equalGateWay = IsFresher ? EqualSettings.Current.Fresher : EqualSettings.Current.ExperiencedPerson;
                }
                return equalGateWay;
            }
        }

        public bool IsEqualVeriRequired { get; set; }
        
        public DateTime EqualStartDate { get; set; }
        public bool IsVerificationRequired
        {
            get
            {
                bool isVerificatinRequired = false;
                if (IsEqualVeriRequired && Doj >= EqualStartDate)
                {
                    isVerificatinRequired = true;
                }
                return isVerificatinRequired;
            }
        }

        public int EmpStatus { get; set; }
        public bool AllowProofUpload { get; set; }
        public bool AllowVerfication { get; set; }
    }
}
