export enum StatusType {
    ACTIVE = 'Active',
    DEACTIVE = 'In-Active'
}


export enum ModalType {
    ADD = 'Add',
    EDIT = 'Edit',
    CREATE = 'Create',
    UPDATE = 'Update',
    VIEW = 'View'
}
export enum RouteUrl {
    MYLEAVES = '/portal/leave/my-leaves'
}

export enum LeaveType {
    PRESENT = 1,
    LEAVE = 2,
    ON_DUTY = 3,
    MANUAL_PRESENT = 4,
    ABSENT = 5,
    CASUAL_LEAVE = 6,
    SICK_LEAVE = 7,
    MATERNITY_LEAVE = 8,
    MARRIAGE_LEAVE = 9,
    COVID_LEAVE = 10,
    BEREAVEMENT_LEAVE = 11,
    SUMMER_VACATION = 12,
    WINTER_VACATION = 13,
    PATERNITY_LEAVE = 14,
    PRIVILEGE_LEAVE = 15,
    SPECIAL_CASUAL_LEAVE = 16,
    SPECIAL_SICK_LEAVE = 17,
    COMPENSATORY_OFF_LEAVE = 18,
    EARLY_LOGOUT_TIME = 19,
    SESSION_BREAK = 20,
    LOSS_OF_PA_DAY = 21,
}
export enum OfficeType {
    COLLEGES = 1,
    SCHOOLS = 2,
    ZONAL_OFFICE = 7,
    CENTRAL_OFFICE = 8,
    NSPIRA_CC = 32,
    NSPIRA_S = 23,
    NSPIRA_C = 22
}
export enum LogFolders {
    ERROR = 'ERROR',
    INFO = 'INFO',
    DEBUG = 'DEBUG',
    TRACE = 'TRACE'
}
export enum ContextMenuList {
    COPY_TITLE = 'Choose Action',
    COPY_ALL = 'Copy All',
    COPY_UP = 'Copy Up',
    COPY_DOWN = 'Copy Down',
}
export enum ReviewerType {
    Self = 1,
    Appriser = 2,
    Reviewer = 3
}