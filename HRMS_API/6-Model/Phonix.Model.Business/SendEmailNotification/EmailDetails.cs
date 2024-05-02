namespace Phoenix.Model.Business.SendEmailNotification
{
    public class EmailDetails
    {
        public int LEAVEEMAILID { get; set; }
        public int TEMPLATEID { get; set; }
        public int EMPLOYEELEAVEID { get; set; }
        public string FROMEMPLOYEEEMAIL { get; set; }
        public string TOEMPLOYEEEMAIL { get; set; }
        public string CCEMPLOYEEEMAIL { get; set; }
        public string SUBJECT { get; set; }

        public string EMAILBODY { get; set; }

        public bool STATUS { get; set; }
    }
}
