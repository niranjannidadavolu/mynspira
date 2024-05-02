namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class EmailConfiguration
    {
        public static EmailConfiguration Current;

        public EmailConfiguration()
        {
            Current = this;
        }

        public string FromEmailAddress { get; set; }
        public string ToEmailAddress { get; set; }
        public string CcEmailAddress { get; set; }
    }
}
