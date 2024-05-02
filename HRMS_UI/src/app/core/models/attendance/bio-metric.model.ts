export interface BioMetric {
    EmployeeNumber: string;
    EmployeeName: string;
    OfficeName: string;
    AttendanceDate: string;
    DisplayAttendanceDate: string;
    StartTime: string;
    DisplayStartTime: string;
    EndTime: string | null;
    DisplayEndTime: string;
    WeekDay: string;
    ElapsedSeconds: number;
    TotalHours: number;
    TotalTime: string;
    Day: number;
    DayMonth: string;
}