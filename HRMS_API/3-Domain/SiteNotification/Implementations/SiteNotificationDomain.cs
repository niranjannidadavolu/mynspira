using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Phoenix.Database.Repository.LeaveManagement;
using Phoenix.Database.Repository.SiteNotificaton;
using Phoenix.Domain.Notification.Interfaces;
using Phoenix.Domain.SiteNotification.Interfaces;
using Phoenix.Model.Business.LeaveManagement;
using Phoenix.Model.Business.Notification;
using Phoenix.Model.Business.SiteNotification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Domain.SiteNotification.Implementations
{
    public class SiteNotificationDomain : ISiteNotificationDomain
    {
        private readonly IConfiguration configuration;
        private readonly ILoggerManager logger;
        public SiteNotificationDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<SiteNotificationDetails> GetSiteNotifications(int officeTypeslno)
        {
            using (SiteNotificationRespository SiteNotificationRespository = new(configuration,logger))
            {
                return await SiteNotificationRespository.GetSiteNotifications(officeTypeslno);
            }
        }

        public async Task<EmpLeaveResponse> SaveEmployeeFeedback(EmployeeFeedbackDetails empFeedbackRequest)
        {
            EmpLeaveResponse empFeedback = new EmpLeaveResponse();
            using (SiteNotificationRespository leaveManagementRepository = new(configuration, logger))
            {
                empFeedback = await leaveManagementRepository.SaveEmployeeFeedback(empFeedbackRequest);
            }
            return empFeedback;
        }
    }
}
