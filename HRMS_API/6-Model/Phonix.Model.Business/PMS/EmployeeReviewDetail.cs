using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.PMS
{
    public class EmployeeReviewDetail
    {
        public int? RecordId { get; set; }

        public int? KraSlno { get; set; }
        public string? KraName { get; set; }
        public int? KpiSlno { get; set; }
        public string? KpiName { get; set; }
        public int MaxScore { get; set; }
        public int? FrequencySlno { get; set; }
        public string? FrequencyName{ get; set; }
        public double? EmployeeScore { get; set; }
        public string? EmployeeComments { get; set; }
        public int? AppraiserEmployeeSlno { get; set; }
        public string? AppraiserEmployeeName { get; set; }
        public string? AppraiserDepartment { get; set; }
        public string? AppraiserDesignation { get; set; }
        public string? AppraiserOfficeTypeName { get; set; }
        public string? AppraiserBranchName { get; set; }
        public string? AppraiserPersonalEmail { get; set; }
        public string? AppraiserWorkEmail { get; set; }
        public double? AppraiserScore { get; set; }
        public string? AppraiserComments { get; set; }
        public int? ReviewerEmployeeSlno { get; set; }
        public string? ReviewerEmployeeName { get; set; }
        public string? ReviewerDepartment { get; set; }
        public string? ReviewerDesignation { get; set; }
        public string? ReviewerOfficeTypeName { get; set; }
        public string? ReviewerBranchName { get; set; }
        public string? ReviewerPersonalEmail { get; set; }
        public string? ReviewerWorkEmail { get; set; }
        public double? ReviewerScore { get; set; }
        public string? ReviewerComments { get; set; }
        public int? ReviewId { get; set; }
    }
}
