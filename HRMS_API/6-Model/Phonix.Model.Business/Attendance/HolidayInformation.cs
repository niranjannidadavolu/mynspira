namespace Phoenix.Model.Business.Attendance
{
    public class HolidayInformation
    {
        public HolidayInformation()
        {
            HolidayName = string.Empty;
            MonthName=string.Empty;            
        }
        public DateTime HolidayDate { get; set; }
        public string HolidayName { get; set; }
        public string MonthName { get; set; }
        public string Day { get; set; }

        public string WeekDay
        {
            get
            {
                string dayName = string.Empty;
                dayName = HolidayDate.DayOfWeek.ToString();
                return dayName;
            }
        }
    }
}
