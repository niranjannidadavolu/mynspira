

namespace Phoenix.Model.Business.TMS
{
    public class AssignBranchDetails
    {
        public int RecordId { get; set; }
        public int Employeeslno { get; set; }
        public string? Employee { get; set; }
        public int Locationslno { get; set; }
        public string FromLocationName { get; set; }
        public string ToLocationName { get; set; }
        public string MotherBranchName { get; set; }
        public int MappingBranchSlno { get; set; }
        public int MotherBranchId { get; set; }
        public decimal TotalDistance { get; set; }
        public decimal AutoFare { get; set; }
        public decimal TicketFare { get; set; }
        public decimal DAAmount { get; set; }
        public decimal TotalAmount
        {
            get
            {
                decimal totalAmount = 0;
                totalAmount = AutoFare + TicketFare + DAAmount;
                return totalAmount;
            }
        }
        public int StatusId { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}
