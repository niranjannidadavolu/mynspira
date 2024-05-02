using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType;

namespace Phoenix.Model.Business.PMS
{
    public class EmployeeReviewInformation
    {
        public int? ReviewId { get; set; }
        public string? ReviewNumber { get; set; }
        public DateTime? ReviewStartDate { get; set; }
        public DateTime? ReviewEndDate { get; set; }
        public DateTime? ReviewAssignedDate { get; set; }
        public DateTime? ReviewSubmittedDate { get; set; }

        public int? EmployeeSlno { get; set; }
        public string? EmployeeName { get; set; }
        public string? EmployeeId { get; set; }
        public string? Department { get; set; }
        public string? DepartmentName { get; set; }
        public string? Designation { get; set; }
        public string? OfficetypeName { get; set; }
        public string? BranchName { get; set; }
        public string? PersonalEmail { get; set; }
        public string? WorkEmail { get; set; }
        public bool? IsDraft { get; set; }
        public bool? IsSubmitted { get; set; }
        public bool? IsAppraiserReviewed { get; set; }
        public bool? IsReviewerReviewed { get; set; }
        public string? EmployeeComments { get; set; }
        public string? AppraiserComments { get; set; }
        public string? ReviewerComments { get; set; }

        public double? EmployeeScore { get; set; }
        public double? ReviewerScore { get; set; }
        public double? AppraiserScore { get; set; }


        public DateTime? AppraiserReviewDate { get; set; }
        public DateTime? ReviewerReviewDate { get; set; }
        public string? AppraiserEmployeeName { get; set; }
        public string? ReviewerEmployeeName { get; set; }

        public List<EmployeeReviewDetail>? EmployeeReviewDetails { get; set; }
    }
}
