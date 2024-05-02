namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class MailSettings
    {
        public static MailSettings Current;

        public MailSettings()
        {
            Current = this;
        }

        public string FromEmail { get; set; }
        public string Password { get; set; }
        public int Port { get; set; }
        public string Host { get; set; }
        public int EnableSsl { get; set; }
        public int UseDefaultCredentials { get; set; }
        public int DeliveryMethod { get; set; }
    }
}
