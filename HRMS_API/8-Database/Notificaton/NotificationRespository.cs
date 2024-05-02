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
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.Notificaton
{
    public class NotificationRespository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public NotificationRespository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<NotificationDetail>> GetNotifications(int employeeSlno)
        {
            List<NotificationDetail> notifications = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", employeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                notifications = (await connection.QueryAsync<NotificationDetail>(DatabaseProcedures.GET_NOTIFICATIONS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in notifications)
            {
                string[] imagesPath = null;
                StringBuilder imagePath = new StringBuilder();
                imagesPath = item.PhotoPath.Split('/');
                imagePath.AppendFormat("{0}/photos/{1}", ApplicationSettings.Current.ProfilePath, imagesPath[2]);
                item.PhotoPath = imagePath.ToString();
            }
            return notifications;
        }
    }
}
