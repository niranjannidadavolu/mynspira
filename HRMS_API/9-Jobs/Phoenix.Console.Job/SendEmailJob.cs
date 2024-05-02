using Microsoft.Extensions.Configuration;
using Phoenix.Application.LeaveAutoApproval.Interfaces;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Console.Job.Email;
using Phoenix.Console.Job.LeaveManagement;
using Phoenix.CrossCutting.Logging;
using Phoenix.Model.Business.LeaveAutoApproval;
using Phoenix.Model.Business.SendEmailNotification;

namespace Phoenix.Console.Job
{
    public class SendEmailJob
    {
        private readonly ISendEmailApplication sendEMaialApplication;
        private readonly ILoggerManager logManager;
        private readonly IConfiguration configuration;
        private readonly IEmailNotificationService emailService;

        public SendEmailJob(ISendEmailApplication sendEMaialApplication, ILoggerManager logManager, IConfiguration configuration, IEmailNotificationService emailService)
        {
            this.logManager = logManager;
            this.sendEMaialApplication = sendEMaialApplication;
            this.logManager = logManager;
            this.configuration = configuration;
            this.emailService = emailService;
        }

        public async Task Run()
        {
            List<EmailDetails> pendingEmails =  await  this.sendEMaialApplication.GetPendingEmails();
            await this.emailService.SendEmailNotification(pendingEmails);
        }
    }
}
