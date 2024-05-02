export enum LEAVE_STATUS_ID {
    Disabled = 0,
    Pending_For_Approval = 1,
    Approved = 2,
    Rejected = 3,
    OnHold = 4,
    Canceled = 5
}

export const LeaveDayType = {
    fullDay: 'Full Day'
}

export const RouteConst = {
    portal_dashboard: '/portal/dashboard'
}

export const LeaveApplyLimitDays = {
    days: 20,
    sickeLeaveMinDate: '26',
    monthMinDate: '26',
    monthMaxDate: '25'
}
export const approveLeaveBtnShow = {
    add: 'add',
    approve: 'approve',
    reject: 'reject',
    view: 'view',
    approveOrReject: 'approveOrReject'
}
export enum DisableWeekdays {
    SUNDAY = 'SUNDAY',
    MONDAY = 'MONDAY'
}