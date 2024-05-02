export class LeaveDetail {
  LeaveId: number = 0;
  EntitlementId: number = 0;
  ConsumedLeaves: number = 0;
  LeaveFrom?: Date;
  LeaveTo?: Date;
  Remarks: string = '';
  LeaveAppliedOn?: Date;
  TotalDaysTaken: number = 0;
  ApprovedRemarks?: string = '';
  ApprovedBy: number =0;
  ApprovedOn?: Date;
  LeaveStatusName: string = '';
  LeaveTypeName: string = '';
  LeaveTypeCode: string = '';
  LeaveDayTypeName: string = '';
  StatusId: number = 0;
  EmployeeName: string = '';
  EmpId: string = '';
  PhotoPath: string = '';
  LeaveStatusId: number = 0
  ManagerId: any;
  LeaveStatusStyle: string = '';
  FromDateDayTypeId: number = 0;
  ToDateDayTypeId: number = 0;
  LeaveWorkFlows: any;
}