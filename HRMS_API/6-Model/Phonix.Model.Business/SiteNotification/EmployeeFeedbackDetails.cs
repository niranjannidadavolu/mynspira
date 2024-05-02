using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.SiteNotification
{
    public class EmployeeFeedbackDetails
    {
        public int Feedback_Id { get; set; }
        public string Feedback { get; set; }
        public int Office_Type_Slno { get; set; }
        public int Created_by { get; set; }
        public DateTime Created_Date { get; set; }
        public int Display_Duration { get; set; }
        public int Status { get; set; }

        public int EmployeeSlno { get; set; }

        public string ToEmail { get; set; }
        public string FromEmail { get; set; }
        public string Body { get; set; }
        public string CCEmail { get; set; }
        public string Subject { get; set; }
    }
}
