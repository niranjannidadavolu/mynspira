using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.Notification;
using Phoenix.Model.Business.SiteNotification;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.SiteNotificaton
{
    public class SiteNotificationRespository : BaseRepository
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;
        public SiteNotificationRespository(IConfiguration configuration, ILoggerManager logger) : base(configuration)
        {
            this.configuration = configuration;
            this.logger = logger;
        }

        public async Task<SiteNotificationDetails> GetSiteNotifications(int officeTypeslno)
        {
            SiteNotificationDetails sitenotifications = null;
            using (var connection = await CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iOFFICETYPESLNO", officeTypeslno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                sitenotifications = await connection.QueryFirstOrDefaultAsync<SiteNotificationDetails>(DatabaseProcedures.GET_SITE_NOTIFICATIONS, parameters, commandType: CommandType.StoredProcedure);

            }
            return sitenotifications;
        }

        public async Task<EmpLeaveResponse> SaveEmployeeFeedback(EmployeeFeedbackDetails feedbackDetails)
        {
            EmpLeaveResponse response = null;
            EmployeeFeedbackDetails empFeedback = null;

            //bool resp = false;
            var toEmail = ApplicationSettings.Current.FeedbackEmail;
            var Subject = ApplicationSettings.Current.FeedbackSubject;
            int FeedbackSave = 0;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                using (var tran = connection.BeginTransaction())
                {
                    parameters = new OracleDynamicParameters();
                    parameters.Add(name: "iFEEDBACK", feedbackDetails.Feedback, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "IEMPLOYEESLNO", feedbackDetails.Created_by, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "IEMAIL_SUBJECT", Subject, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iOFFICETYPESLNO", feedbackDetails.Office_Type_Slno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iCREATEDBY", feedbackDetails.Created_by, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iEMPLOYEE_EMAIL", feedbackDetails.FromEmail, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    parameters.Add(name: "iTO_EMAIL", toEmail, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    FeedbackSave = await connection.ExecuteAsync(DatabaseProcedures.INSERT_EMP_FEEDBACK, parameters, commandType: CommandType.StoredProcedure);
                    tran.Commit();

                    response = new EmpLeaveResponse
                    {
                        Response = true,
                        Message = "Record created."
                    };
                }
            }
            return response;
        }


    }
}
