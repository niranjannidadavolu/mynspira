using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.TMS
{
    public class VisitPlanDetails
    {
        public int? RecordId { get; set; }
        public int? TravelId { get; set; }
        public string? LocationSlno { get; set; }
        public string? BranchSlno { get; set; }
        public string? TotalDistance { get; set; }
        public Decimal? AutoFare { get; set; }
        public Decimal? TicketFare { get; set; }
        public Decimal? DAAmount { get; set; }
        public Decimal? AllowedAutoFare { get; set; }
        public Decimal? AllowedTicketFare { get; set; }
        public Decimal? AllowedDAAmount { get; set; }
        public string? RowVersion { get; set; }
        public string? StatusID { get; set; }
        public string? CreatedBY { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string? UpdatedBY { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int OperationType { get; set; }
        
    }
}
