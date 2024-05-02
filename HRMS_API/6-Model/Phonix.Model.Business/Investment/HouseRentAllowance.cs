namespace Phoenix.Model.Business.Investment
{
    public class HouseRentAllowance
    {
        public HouseRentAllowance()
        {
            RentPaymentDetails = new List<RentPayment>();
        }
        public int? LocationId { get; set; }
        public bool IsRentHouse { get; set; }
        public string? HouseNumber { get; set; }
        public string? StreetName { get; set; }
        public int? MandalId { get; set; }
        public int? DistrictId { get; set; }
        public int? StateId { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Pincode { get; set; }

        public List<RentPayment> RentPaymentDetails { get; set; }

    }
}
