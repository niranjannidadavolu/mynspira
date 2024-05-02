using Phoenix.Model.Business.Masters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.LeaveManagement
{
    public class LeaveEncashment
    {
        public int EncashmentId { get; set; }
        public int EntitlementId { get; set; }

        public int EmployeeSlno { get; set; }
        public int TotalDaysTaken { get; set; }
        public decimal EncashmentAmount { get; set; }
        public decimal TaxbleAmount { get; set; }
        public decimal TotalAmount { get; set; }
        public string Remarks { get; set; }
        public int StatusId { get; set; }
        public int LeaveBalance { get; set; }
        public int BranchSlno { get; set; }
        public int EmpSlno { get; set; }
        public int UniqueNo { get; set; }
        public int FinSlno { get; set; }
        public bool IsApproved { get; set; }
        public bool IsPaid { get; set; }
        public DateTime CreatedDate { get; set; }
        public string StatusName { get; set; }
        public string ApprovedRemarks { get; set; }
        public DateTime ApprovedOn { get; set; }
        public int ApprovedBy { get; set; }

        public List<EncashmentWorkFlow> EncashmentWorkFlows { get; set; }
    }
    public class EncashmentWorkFlow
    {
        public int EncashmentId { get; set; }
        public string EmployeeNumber { get; set; }
        public int ReportingEmployeeSlno { get; set; }

        public string ReportingEmployeeNumber { get; set; }
        public string ReportingEmployeeName { get; set; }
        public int StepId { get; set; }
        public int StepTypeId { get; set; }

        public int WorkFlowTypeId { get; set; }
        public int LeaveStatusId { get; set; }
        public string LeaveStatusName { get; set; }
        public int AssignedTo { get; set; }
        public DateTime AssignedDate { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public int ApprovedBy { get; set; }
        public string ApprovedRemarks { get; set; }
        public DateTime AppliedDate { get; set; }

        public string AppliedRemarks { get; set; }
        public string UniqueNumber
        {
            get
            {
                string uniqueNumber = string.Format("{0}-{1}", EncashmentId, StepId);
                return uniqueNumber;
            }
        } }


    public class LeaveEncashmentReq
    {
        public int EmployeeSlno { get; set; }
        public int EntitlementId { get; set; }
        public int TotalDaysTaken { get; set; }
        public decimal EncashmentAmount { get; set; }
        public decimal TaxbleAmount { get; set; }
        public decimal TotalAmount { get; set; }
        public string Remarks { get; set; }
        public int StatusId { get; set; }
        public int LeaveBalance { get; set; }
        public int BranchSlno { get; set; }
        public int EmpSlno { get; set; }
        public int UniqueNo { get; set; }
        public int FinSlno { get; set; }
    }
    public class UpdateEncashmentReq
    {
        public int EmployeeSlno { get; set; }
        public int EncashmentId { get; set; }
        public int StepMasterId { get; set; }
        public int StepId { get; set; }
        public int StepTypeId { get; set; }
        public int WorkFlowTypeId { get; set; }
        public string ApprovedRemarks { get; set; }
        public int LeaveStatusId { get; set; }
    }

    public class DeleteEncashmentReq
    {
        public int EncashmentId { get; set; }
        public int EntitlementId { get; set; }
        public int TotalDaysTaken { get; set; }
        public int UpdatedBy { get; set; }
    }
    public class LeaveEncashmentApprovalsDetails
    {
        public int EncashmentId { get; set; }
        public int EmployeeSlno { get; set; }
        public decimal BranchSlno { get; set; }
        public decimal EmpSlno { get; set; }
        public decimal UniqueNo { get; set; }
        public decimal FinSlno { get; set; }
        public int TotalDaysTaken { get; set; }
        public decimal EncashmentAmount { get; set; }
        public int TaxbleAmount { get; set; }
        public decimal TotalAmount { get; set; }
        public string Remarks { get; set; }
        public decimal IsApproved { get; set; }
        public decimal IsPaid { get; set; }
        public int StatusId { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
        public int LeaveStatusId { get; set; }
        public string? LeaveStatusName { get; set; }
        public int EnCashmentWorkFlowstepId { get; set; }
        public int WorkFlowTypeId { get; set; }
        public int StepTypeId { get; set; }
        public int StepMasterId { get; set; }
        public string BranchName { get; set; }
        public string LeaveStatusStyle { get; set; }
        public string? EmployeeName { get; set; }
        public string EmpId { get; set; }
        public int BiomatricRegNo { get; set; }
        public int LeaveBalance { get; set; }
    }
}
