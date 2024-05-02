using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.TMS
{
    public class CreatePlanDetails
    {

        public int TravelID { get; set; }
        public string? TravelCode { get; set; }
        public DateTime TravelDate { get; set; }
        public int EmployeeSlno { get; set; }
        public string? RowVersion { get; set; }
        public int StatusID { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
        public int? ApprovedBy { get; set; }
        public DateTime ApprovedDate { get; set; }
        public string? ApprovedRemarks { get; set; }
        public int LocationSlno { get; set; }
        public int BranchSlno { get; set; }
        public int TotalDistance { get; set; }
        public decimal AutoFare { get; set; }
        public decimal TicketFare { get; set; }
        public decimal DAAmount { get; set; }
        public decimal AllowedAutoFare { get; set; }
        public decimal AllowedTicketFare { get; set; }
        public decimal AllowedDAAmount { get; set; }
        public string? Employee { get; set; }
       // public string LocationName { get; set; }
        public string? FromLocation { get; set; }

        public string? BranchName { get; set; }
        public string? MotherBranch { get; set; }

        public int? Biomatric { get; set; }
        public decimal TotalAmount
        {
            get
            {
                decimal totalAmount = 0;
                totalAmount = AutoFare + TicketFare + DAAmount;
                return totalAmount;
            }
        }
        public decimal TotalApproveAmount
        {
            get
            {
                decimal totalAmount = 0;
                totalAmount = AllowedAutoFare + AllowedTicketFare + AllowedDAAmount;
                return totalAmount;
            }
        }
    }
  
}
