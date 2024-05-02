using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Notification;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Notificaton
{
    public class VistorCountRespository : BaseRepository
    {
        private readonly IConfiguration configuration; 
        public VistorCountRespository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }
        public async Task<int> GetVisitorCount()
        {
            int loggedInUsers = 0;
            bool isUpdated = false;
            string loginQuery = "SELECT SP_GET_LOGGED_IN_USER_COUNT() AS USER_COUNT FROM DUAL";
            using (IDbConnection connection = await CreateConnection(DbSchema.PORTAL))
            {
                  loggedInUsers = connection.ExecuteScalar<int>(loginQuery);
            }
            return loggedInUsers;
        }
    }
}
