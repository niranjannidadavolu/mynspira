
﻿using System;

namespace Phoenix.Model.Business.Administration
{
    public class LeaveInformation
    {
        public int LeaveTypeID { get; set; }
        public int LeaveInformationID { get; set; }
        public string LeaveInformationName { get; set; }
        public int LeavePolicyID { get; set; }
        public string? PolicyName { get; set; }
        public string? LeaveTypeName { get; set; }
        public int OfficeTypeSlno { get; set; }
        public int StatusID { get; set; }
        public int? BranchSlno { get; set; }


        public string OfficeTypeName { get; set; }
        //public string BranchName { get; set; }

    }


    public class LeaveInformationSaveReq
    {
        public int LeaveTypeID { get; set; }
        public int? LeaveInformationID { get; set; }
        public string LeaveInformationName { get; set; }
        public int LeavePolicyID { get; set; }
        public int OfficeTypeSlno { get; set; }
        public int StatusID { get; set; }
        public int? BranchSlno { get; set; }
        public DateTime? CreatedBy { get; set; }
        public DateTime? UpdatedBy { get; set; }
    }


    
    public class LeaveTypeInformation
    {
        public int LeaveInformationId { get; set; }

        public string LeaveInformationName { get; set; }

        public int LeaveTypeId { get; set; }
        public string LeaveTypeName { get; set; }
    }
}
