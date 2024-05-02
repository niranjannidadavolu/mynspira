using System.Collections.Generic;

namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class OracleSettings
    {
        public static OracleSettings Current;

        public List<OracleSettings> Settings;

        public OracleSettings()
        {
            Current = this;
            //List<OracleSettings> dbConfig = configuration.GetSection("OracleSettings").Get<List<OracleSettings>>();

            //settings = this as List<OracleSettings>;
        }

        public string Host { get; set; }
        public string Port { get; set; }
        public string Username { get; set; }
        public string Database { get; set; }
        public string Password { get; set; }
        //public string ConnectionString { get => $"Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST={Host})(PORT={Port}))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME={Database})));User Id={Username};Password={Password};"; }

        public string ConnectionString
        {
            get
            {
                string connectionString = string.Empty;
                connectionString = "(ADDRESS=(PROTOCOL=TCP)(HOST={0})(PORT={1}))";
                connectionString = string.Format(connectionString, Host, Port);
                return connectionString;
            }
        }

    }

    public class OracleSettingValues
    {
        public static List<OracleSettings> settings;
        public OracleSettingValues()
        {
            settings = new List<OracleSettings>();
        }
    }
}