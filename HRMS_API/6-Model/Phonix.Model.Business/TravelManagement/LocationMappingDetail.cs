using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Infrastructure.BusinessModel;

namespace Phoenix.Model.Business.TravelManagement
{
    public class LocationMappingDetail : BaseBusinessEntity
    {
        public LocationMappingDetail() { }
        public int RecordId { get; set; }
        public int LocationMappingId { get; set; }
        public int FromLocationId { get; set; }
        public string? FromLocationName { get; set; } = null!;
        public int StateId { get; set; }
        public string StateName { get; set; } = null!;
        public int DistrictId { get; set; }
        public string DistrictName { get; set;} = null!;
        public int MotherBranchId { get; set; }
        public string MotherBranchName { get; set; } = null!;
        public int ToBranchId { get; set; }
        public string ToBranchName { get; set; } = null!;
        public bool IsLocal { get; set; }
        public decimal Distance { get; set; }
        public decimal AutoFare { get; set; }
        public decimal TicketFare { get; set; }
        public decimal DaAmount { get; set; }

        public int? Employeeslno { get; set; }
        public string? EmployeeName { get; set; }
        public string? Department { get; set; }
        public string? Designation { get; set; }
        public string? OfficeTypeName { get; set; }
        public string? EmployeeNumber { get; set; }
    }
}
