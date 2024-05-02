export class EmpLeaveDetails{
    LeaveId: number=0;
    EntitlementId: number=0;
    EmployeeSlno: number=0;
    LeaveFrom?: Date;
    LeaveTo?: Date;
    Remarks: string='';
    LeaveAppliedOn?: Date;
    TotalDaysTaken: number=0;
    ApprovedRemarks: string='';
    ApprovedOn?: Date;
    LeaveStatusName: string='';
    LeaveTypeName: string='';
    LeaveTypeCode: string='';
    LeaveDayTypeName: string='';
    ConsumedLeaves:number=0;
}