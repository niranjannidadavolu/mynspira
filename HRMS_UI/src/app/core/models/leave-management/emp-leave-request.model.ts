export class EmpLeaveRequest {
    EntitlementId: number = 0;
    EmployeeSlno: number = 0;
    DateLeaveFrom?: Date;
    DateLeaveTo?: Date;
    FromDateDayTypeId: number = 0;
    ToDateDayTypeId: number = 0;
    LeaveTypeId: number = 1;
    Remarks: string = '';
    LeaveAppliedOn?: Date;
    LeaveDayTypeId: number = 0;
    TotalDaysTaken: number = 0;
    TotalPublicHolidays: number = 0;
    TotalHolidays: number = 0;
    TotalUnpaidDays: number = 0;
    LeaveStatusId: number = 0;
    RowVersion: string = '';
    CreatedBy: string = '';
    LeaveInformationId: number = 0;
    ConsumedLeaves: number = 0;
    AvailableLeaveBalance: number = 0;
    EmpName: string = '';
    ToEmployeeSlno: number = 0;
    BranchSlno: number = 0;
    LeaveTypeReason: any;
}