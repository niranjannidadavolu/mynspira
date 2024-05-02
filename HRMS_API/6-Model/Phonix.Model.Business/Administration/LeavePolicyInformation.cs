using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.Administration
{
    public class LeavePolicyInformation
    {
        public int? PolicyID { get; set; }
        public string PolicyName { get; set; }
        public int? LowerBound { get; set; }
        public int? UpperBound { get; set; }
        public int? ApplyBeForeDays { get; set; }
        public int? MaxConcecutiveDays { get; set; }
        public int? AllowAfter_MaxConcecutive { get; set; }
        public int? AccrualRate { get; set; }
        public int? NeedCertificate { get; set; }
        public bool? ConsiderWeekendsHolidays { get; set; }
        public bool? CanBeMergedWithOther { get; set; }
        public int? MaximumUsage { get; set; }
        public int? ApplicableTo { get; set; }
        public bool? CanApplyHalfDay { get; set; }
        public int StatusID { get; set; }
        public int? Rowversion { get; set; }
        public DateTime? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }

    }

    public class LeavePolicyInformationReq
    {
        public int PolicyID { get; set; }
        public string PolicyName { get; set; }
        public int? LowerBound { get; set; }
        public int? UpperBound { get; set; }
        public int? ApplyBeForeDays { get; set; }
        public int? MaxConcecutiveDays { get; set; }
        public int? AllowAfter_MaxConcecutive { get; set; }
        public int? AccrualRate { get; set; }
        public int? NeedCertificate { get; set; }
        public bool? ConsiderWeekendsHolidays { get; set; }
        public bool? CanBeMergedWithOther { get; set; }
        public int? MaximumUsage { get; set; }
        public int? ApplicableTo { get; set; }
        public bool? CanApplyHalfDay { get; set; }
        public int StatusID { get; set; }
        public int? Rowversion { get; set; }

    }

}
