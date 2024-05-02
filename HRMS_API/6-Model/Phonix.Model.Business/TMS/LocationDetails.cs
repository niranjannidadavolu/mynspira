using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.TMS
{
    public class LocationDetails
    {   public int LocationSlno { get; set; }
        public string FromLocation { get; set; }
    }
    public class ToLocationDetails
    {
        public int ToLocationID { get; set; }
        public string ToLocationName { get; set; } 
    }
    public class Location
    {
        public List<LocationDetails> FromLocation { get; set; }
        public List<ToLocationDetails> ToLocation { get; set; }

    }
    public class EmployeeToLocation
    {
        
        public int LocationMappingid { get; set; }
        public int LocationSlno { get; set; }
        public string FromLocationName { get; set; }
        public int MappingBranchSlno { get; set; }
        public string ToLocationName { get; set; }
        public int MotherBranchId { get; set; }
        public string MotherBranchName { get; set; }
        public int TotalDistance { get; set; }
        public int AutoFare { get; set; }
        public int TicketFare { get; set; }
        public int DAAmount { get; set; }
        public decimal TotalAmount
        {
            get
            {
                decimal totalAmount = 0;
                totalAmount = AutoFare + TicketFare + DAAmount;
                return totalAmount;
            }
        }
        //public int Createdby { get; set; }
        //public int CreatedDate { get; set; }
        //public int Updatedby { get; set; }
        //public int UpdatedDate { get; set; }
        //public int StatusId { get; set; }

    }

}
