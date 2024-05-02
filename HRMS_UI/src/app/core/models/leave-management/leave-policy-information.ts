export class LeavePolicyInformation {
    AccrualRate !: number;
    AllowAfter_MaxConcecutive !: number;
    ApplicableTo !: number;
    ApplyBeForeDays !: number;
    CanApplyHalfDay !: number;
    CanBeMergedWithOther !: number;
    CanCarryforward !: number;
    CarryForwardDays !: number;
    CarryForwardLifeTime !: number;
    ConsiderWeekendsHolidays !: boolean | undefined;
    CreatedBy !: number;
    CreatedDate !: Date;
    LowerBound !: number;
    MaxConcecutiveDays !: number;
    MaximumUsage !: number;
    NeedCertificate !: number;
    PolicyID !: number;
    PolicyName !: string | undefined;
    Rowversion !: string | undefined;
    StatusID !: number;
    UpdatedBy !: number;
    UpdatedDate !: Date;
    UpperBound!: number;
}


export class LeaveInformations {
    LeaveInformationID !: number;
    LeaveInformationName!: string | undefined;
    LeaveTypeID !: number;
    LeavePoLicyID !: number;
    OfficeTypeSlno !: number;
     BranchSlno!: number;
    // EmployeeSlno!: number;
    StatusID!: boolean;
    // RowVersion!: string | undefined;
    // CreatedBy!: number;
    // CreatedDate!: number;
    // UpdatedBy!: number;
    // UpdatedDate!: number;
    // DesignationSlno!: number;

}