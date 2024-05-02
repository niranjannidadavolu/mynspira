namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class NConnectSettings
    {
        public static NConnectSettings Current { get; set; }

        public NConnectSettings()
        {
            Current = this;
        }

        public string SecurityKey { get; set; }
        public string SecuritySalt { get; set; }
    }
}
