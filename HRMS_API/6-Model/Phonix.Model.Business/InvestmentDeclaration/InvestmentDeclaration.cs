namespace Phoenix.Model.Business.InvestmentDeclaration
{
    public class InvestmentDeclaration
    {
        public int EmployeeTdsId { get; set; }
        public long FinancialYearId { get; set; }
        public long EmployeeId { get; set; }
        public int UniqueNumber { get; set; }
        public bool IsVerified { get; set; }
        public int AssesseeTypeId { get; set; }
        public bool Is_NewRegime { get; set; }
        public bool Is_Senior_Citizen { get; set; }
        public int? LocationId { get; set; }
        public bool IsRentHouse { get; set; }
        public string? HouseNumber { get; set; }
        public string? StreetName { get; set; }
        public int? MandalId { get; set; }
        public int? DistrictId { get; set; }
        public int? StateId { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Pincode { get; set; }
        public List<SectionDetail> SectionDetails { get; set; }
    }

    public class SectionDetail
    {
        public int RecordId { get; set; }
        public int? ParentId { get; set; }
        public int SaveId { get; set; }
        public string HeaderName { get; set; }

        public int RentPaymentId { get; set; }
        public string? RentOwnerName { get; set; }
        public string? RentOwnerPan { get; set; }
        public int RentNoOfMonths { get; set; }
        public decimal RentAmount { get; set; }
        public decimal RentVerifiedAmount { get; set; }
        public string? RentVerifiedRemarks { get; set; }
        public int RentVerifiedUserSlNo { get; set; }
        public int RentFileCount { get; set; }
        public string? RentDescription { get; set; }
        public string? RentPanNumber { get; set; }
        public int? RentHouseIncomeHeadId { get; set; }

        public int Chapter6DetailId { get; set; }
        public int Chapter6SubHeadId { get; set; }
        public decimal Chapter6Amount { get; set; }
        public decimal Chapter6VerifiedAmount { get; set; }
        public string? SectionName { get; set; }
        public string? Chapter6Particulars { get; set; }
        public string? Chapter6VerifiedRemarks { get; set; }
        public int Chapter6VerifiedUserSlNo { get; set; }
        public int Chapter6FileCount { get; set; }

        public int HouseIncomeDetailId { get; set; }
        public int HouseIncomeHeadId { get; set; }
        public decimal HouseIncomeAmount { get; set; }
        public decimal HouseIncomeVerifiedAmount { get; set; }
        public string HouseIncomeDescription { get; set; }
        public string HouseIncomePanNumber { get; set; }
        public string? HouseIncomeVerifiedRemarks { get; set; }
        public int HouseIncomeVerifiedUserSlNo { get; set; }
        public int HouseIncomeFileCount { get; set; }

        public int OtherIncomeDetailId { get; set; }
        public int OthIncomeHeadId { get; set; }
        public decimal OtherIncomeAmount { get; set; }
        public decimal OtherIncomeTdsAmount { get; set; }
        public decimal OtherIncomeVerifiedAmount { get; set; }
        public string? OtherIncomeDescription { get; set; }
        public string? OtherIncomeVerifiedRemarks { get; set; }
        public int OtherIncomeVerifiedUserSlNo { get; set; }
        public int OtherIncomeFileCount { get; set; }
    }
}
