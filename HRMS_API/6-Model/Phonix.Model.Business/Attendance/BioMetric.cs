namespace Phoenix.Model.Business.Attendance
{
    public class BioMetric
    {
        public int TotalRecords { get; set; }
        public DateTime AttendanceDate { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime? EndTime { get; set; }
        public DateTime AttendanceStartTime
        {
            get
            {
                DateTime attendancStartTime = new DateTime(AttendanceDate.Year, AttendanceDate.Month, AttendanceDate.Day, StartTime.Hour, StartTime.Minute, StartTime.Second);
                return attendancStartTime;
            }
        }
        public DateTime AttendanceEndTime
        {
            get
            {
                DateTime attendancEndTime = new DateTime(AttendanceDate.Year, AttendanceDate.Month, AttendanceDate.Day, StartTime.Hour, StartTime.Minute, StartTime.Second);
                return attendancEndTime;
            }
        }

        public string DisplayAttendanceDate
        {
            get
            {
                var displayAttendanceDate = AttendanceDate.ToString("dd-MMM-yyyy");
                return displayAttendanceDate;
            }
        }
        public string DisplayStartTime
        {
            get
            {
                var displayStartTime = StartTime.ToString("HH:mm tt");
                if (displayStartTime == "00:00 AM")
                {
                    displayStartTime = String.Empty;
                }
                return displayStartTime;
            }
        }
        public string DisplayEndTime
        {
            get
            {
                string displayEndTime = string.Empty;
                if (EndTime != null)
                {
                    displayEndTime = EndTime.Value.ToString("HH:mm tt");
                }
                if (displayEndTime == "00:00 AM")
                {
                    displayEndTime = String.Empty;
                }
                return displayEndTime;
            }
        }
        public string WeekDay => AttendanceDate.ToString("ddd");

        public double ElapsedSeconds
        {
            get
            {
                double elapsedseconds = 0;
                TimeSpan? TS = EndTime - StartTime;
                if (TS != null)
                {
                    elapsedseconds = TS.Value.TotalSeconds;
                }
                return elapsedseconds;
            }
        }

        public int TotalHours { get; set; }

        public string TotalTime
        {
            get
            {
                string totalTime = string.Empty;
                TimeSpan? TS = EndTime - StartTime;
                if (TS != null)
                {
                    int hour = TS.Value.Hours;
                    int mins = TS.Value.Minutes;
                    int secs = TS.Value.Seconds;
                    totalTime = string.Format("{0}:{1}", hour.ToString("00"), mins.ToString("00"));
                }
                return totalTime;
            }
        }

        public int Day => AttendanceDate.Day;

        public string DayMonth => AttendanceDate.ToString("dd/MMM");

        public string First_Half { get; set; }
        public string Second_Half { get; set; }
        public int Holiday_Type { get; set; }
        public bool CanApplyOnDuty { get; set; }
        public bool RegularOnDuty { get; set; }
        public bool CanApplyCompOff { get; set; }
        public bool CanNotApplyEarlyLogOutTime { get; set; }
        public int EmployeeSlno { get; set; }
        public string EmployeeId { get; set; }

        public string EmployeeName { get; set; }
        public string ClassName
        {
            get
            {
                string className = string.Empty;
                if (First_Half.ToUpper() == "PRESENT" && Second_Half.ToUpper() == "PRESENT")
                {
                    className = "flatpickr-f_present_present";
                }
                else if (First_Half.ToUpper() == "PRESENT" && Second_Half.ToUpper() == "ABSENT")
                {
                    className = "flatpickr-f_present_absent";
                }
                else if (First_Half.ToUpper() == "ABSENT" && Second_Half.ToUpper() == "PRESENT")
                {
                    className = "flatpickr-f_absent_present";
                }
                else if (First_Half.ToUpper() == "ABSENT" && Second_Half.ToUpper() == "ABSENT")
                {
                    className = "flatpickr-f_absent_absent";
                }
                else if (First_Half.ToUpper().Contains("LEAVE") && Second_Half.ToUpper() == "PRESENT")
                {
                    className = "flatpickr-f_leave_present";
                }
                else if (First_Half.ToUpper().Contains("LEAVE") && Second_Half.ToUpper() == "ABSENT")
                {
                    className = "flatpickr-f_leave_absent";
                }
                else if (First_Half.ToUpper() == "PRESENT" && Second_Half.Contains("LEAVE"))
                {
                    className = "flatpickr-f_present_leave";
                }
                else if (First_Half.ToUpper() == "ABSENT" && Second_Half.Contains("LEAVE"))
                {
                    className = "flatpickr-f_absent_leave";
                }
                else if (First_Half.Contains("LEAVE") && Second_Half.Contains("LEAVE"))
                {
                    className = "flatpickr-f_leave_leave";
                }

                else if (First_Half.ToUpper() == "PRESENT" && (Second_Half.Contains("ON DUTY") || Second_Half.Contains("EARLY-LOGOUT")))
                {
                    className = "flatpickr-f_present_od";
                }
                else if (First_Half.ToUpper() == "ABSENT" && (Second_Half.Contains("ON DUTY") || Second_Half.Contains("EARLY-LOGOUT")))
                {
                    className = "flatpickr-f_absent_od";
                }
                else if (First_Half.Contains("ON DUTY") && Second_Half.Contains("PRESENT"))
                {
                    className = "flatpickr-f_od_present";
                }
                else if (First_Half.Contains("ON DUTY") && Second_Half.Contains("ABSENT"))
                {
                    className = "flatpickr-f_od_absent";
                }
                else if (First_Half.Contains("ON DUTY") && Second_Half.Contains("LEAVE"))
                {
                    className = "flatpickr-f_od_leave";
                }
                else if (First_Half.Contains("LEAVE") && (Second_Half.Contains("ON DUTY") || Second_Half.Contains("EARLY-LOGOUT")))
                {
                    className = "flatpickr-f_leave_od";
                }
                else if (First_Half.Contains("ON DUTY") && (Second_Half.Contains("ON DUTY") || Second_Half.Contains("EARLY-LOGOUT")))
                {
                    className = "flatpickr-f_od_od";
                }
                else if (First_Half.ToUpper() != "ABSENT" && First_Half.ToUpper() != "PRESENT" && !First_Half.Contains("LEAVE") && !First_Half.Contains("ON DUTY") && Second_Half.ToUpper() != "ABSENT" && Second_Half.ToUpper() != "PRESENT" && !Second_Half.Contains("LEAVE") && !(Second_Half.Contains("ON DUTY") || Second_Half.Contains("EARLY-LOGOUT")))
                {
                    className = "flatpickr-disabled flatpickr-f_holiday";
                }
                else
                {
                    className = "flatpickr-f_holiday";
                }
                return className;
            }
        }

        public string EmpNo { get; set; }

        public string Employee_Name { get; set; }

    }
}
