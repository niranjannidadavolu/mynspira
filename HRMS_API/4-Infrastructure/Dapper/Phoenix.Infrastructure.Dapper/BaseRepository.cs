using Microsoft.Extensions.Configuration;
using Oracle.ManagedDataAccess.Client;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using System.Data;
using Phoenix.CrossCutting.Helper.ApplicationSettings;

namespace Phoenix.Infrastructure.Dapper
{
    public class BaseRepository : IDisposable, IBaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly string _connectionString;
        public BaseRepository(IConfiguration configuration)
        {
            this.configuration = configuration;
            _connectionString = PrepareConnectionString();
        }

        private string PrepareConnectionString()
        {
            string conn1 = string.Empty;
            string conn2 = string.Empty;
            string userName = string.Empty;
            string password = string.Empty;
            string serviceName = string.Empty;
            List<OracleSettings> settings = OracleSettings.Current.Settings;
            if (settings != null)
            {
                if (settings.Count >= 2)
                {
                    conn1 = OracleSettings.Current.Settings[0].ConnectionString;
                    conn2 = OracleSettings.Current.Settings[1].ConnectionString;
                    userName = OracleSettings.Current.Settings[0].Username;
                    password = OracleSettings.Current.Settings[0].Password;
                    serviceName = OracleSettings.Current.Settings[0].Database;

                }
                else if (settings.Count == 1)
                {
                    conn1 = OracleSettings.Current.Settings[0].ConnectionString;
                    conn2 = string.Empty;
                    userName = OracleSettings.Current.Settings[0].Username;
                    password = OracleSettings.Current.Settings[0].Password;
                    serviceName = OracleSettings.Current.Settings[0].Database;
                }
            }
            string connectionString = "Data Source=(DESCRIPTION=(ADDRESS_LIST=(LOAD_BALANCE=yes){0}{1})(CONNECT_DATA=(SERVER=dedicated)(SERVICE_NAME={4})));User Id={2};Password={3};";
            connectionString = string.Format(connectionString, conn1, conn2, userName, password, serviceName);
            return connectionString;

        }

        public async Task<IDbConnection> CreateConnection(DbSchema schema)
        {
            //string connectionString = string.Empty;
            IDbConnection con = null;
            //connectionString = PrepareConnectionString();
            con = new OracleConnection(_connectionString);
            //switch (schema)
            //{
            //    case DbSchema.PORTAL:
                    
            //        break;
            //    default:
            //        break;
            //}
            if (con.State == ConnectionState.Closed) con.Open();
            return con;
        }
        public object LoggedInUserInformation
        {
            get
            {
                //UserInformation loggedInUserInformation;
                //if (redisCache != null)
                //{
                //    var cachedObj = redisCache.GetString("LoggedInUser");
                //    loggedInUserInformation = JsonConvert.DeserializeObject<UserInformation>(cachedObj);
                //}
                //else
                //{
                //    loggedInUserInformation = new UserInformation();
                //}
                //return loggedInUserInformation;
                return null;

            }
        }


        public void Dispose()
        {
        }
    }
}
