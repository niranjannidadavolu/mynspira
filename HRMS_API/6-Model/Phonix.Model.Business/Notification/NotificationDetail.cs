using Phoenix.CrossCutting.Extension.System.DateTime;

namespace Phoenix.Model.Business.Notification
{
    public class NotificationDetail
    {
        public int NotificationSlno { get; set; }
        public int EmployeeSno { get; set; }
        public string Notification_Details { get; set; }
        public int New_Notification_Count { get; set; }
        public int Total_Notification_Count { get; set; }

        public DateTime CreatedDate { get; set; }
        public string HumanDateString 
        { 
            get
            {
                string value = string.Empty;
                value = CreatedDate.Ago();
                return value;
            }
        }

        public string PhotoPath { get; set; }
        public string EmployeeName { get; set; }

    }
}
