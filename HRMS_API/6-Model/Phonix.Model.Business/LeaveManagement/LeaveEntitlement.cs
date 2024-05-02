using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.DateTime;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveEntitlement
    {
        public int EmployeeLeaveEntitlementId { get; set; }
        public int EmployeeSlno { get; set; }
        public int LeaveInformationId { get; set; }
        public int LeaveInformationIdEn { get; set; }
        public int YearOfLeave { get; set; }
        public DateTime DbDateValidFrom { get; set; }
        public DateTime DbDateValidUntil { get; set; }
        public DateTime? DateValidFrom 
        { 
            get
            {
                DateTime? validFrom = null;
                if(DbDateValidFrom !=DateTime.MinValue)
                {
                    validFrom = DbDateValidFrom;
                }
                else
                {
                    validFrom = DateTime.Now.StartOfYear();
                }
                return validFrom;
            }
        }
        public DateTime? DateValidUntil
        {
            get
            {
                DateTime? validUntil = null;
                if (DbDateValidUntil != DateTime.MinValue)
                {
                    validUntil = DbDateValidUntil;
                }
                else
                {
                    validUntil = DateTime.Now.EndOfYear();
                }
                return validUntil;
            }
        }
        public int LeaveYear
        {
            get
            {
                int leaveYear;
                if (YearOfLeave != 0)
                {
                    leaveYear = YearOfLeave;
                }
                else
                {
                    leaveYear = DateTime.Now.Year;
                }
                return leaveYear;
            }
        }
        public decimal TotalLeaves { get; set; }
        public decimal ConsumedLeaves { get; set; }
        public decimal EncashedLeaves { get; set; }
        public decimal OriTotalLeaves { get; set; }
        public int StatusId { get; set; }
        public string EmployeeName { get; set; }
        public long MobileNumber { get; set; }
        public DateTime Doj { get; set; }
        //public string WorkEmail { get; set; }
        public string EmpId { get; set; }
        public string BranchName { get; set; }
        public int PBranchSlno { get; set; }
        public string OfficeTypeName { get; set; }
        public int OfficeTypeSlno { get; set; }
        public string LeaveInformationName { get; set; }
        public int LeaveTypeId { get; set; }
        public string LeaveTypeName { get; set; }
        public string EmpNo { get; set; }
        public string? RowVersion { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public int? UpdatedBy { get; set; }
        public int NewEncashedLeaves { get; set; }
    }
}
