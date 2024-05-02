using Microsoft.Extensions.Hosting;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.SendEmailNotification;
using Phoenix.Web.Service.Helper.AwsEmailService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Web.Service.HostedService
{
    public class EmailNotificationService : IHostedService
    {
        private readonly ILoggerManager logger;
        private readonly ISendEmailApplication sendEmailApplication;
        private readonly Timer EmailTimer;
        private readonly Timer EmailTimer2;

        private bool isFlag = true;
        private bool isFlag2 = true;
        public EmailNotificationService(ILoggerManager logger, ISendEmailApplication sendEmailApplication)
        {
            this.logger = logger;
            this.sendEmailApplication = sendEmailApplication;
            EmailTimer = new Timer(SendEmailNotifications, null, TimeSpan.Zero, TimeSpan.FromSeconds(60));
        }
        public async Task SendEmailNotification(List<EmailDetails> pendingEmails)
        {
            List<string> toEmailAddresses = null;
            List<string> ccEmailAddresses = null;
            if (ApplicationSettings.Current.RunJobs && JobSettings.Current.SendEmialJob)
            {
                if (ApplicationSettings.Current.Environment.ToUpper() == "PROD")
                {
                    foreach (var item in pendingEmails)
                    {
                        toEmailAddresses = item.TOEMPLOYEEEMAIL.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();
                        ccEmailAddresses = item.CCEMPLOYEEEMAIL.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();

                        await SendEmail(item.SUBJECT, item.EMAILBODY, toEmailAddresses.ToArray(), ccEmailAddresses.ToArray());
                    }
                }
                else
                {
                    foreach (var item in pendingEmails)
                    {
                        toEmailAddresses = EmailConfiguration.Current.ToEmailAddress.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();
                        ccEmailAddresses = EmailConfiguration.Current.CcEmailAddress.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();

                        await SendEmail(item.SUBJECT, item.EMAILBODY, toEmailAddresses.ToArray(), ccEmailAddresses.ToArray());
                    }
                }
            }
            isFlag = true;
        }


        private async Task SendEmail(string mailSubject, string mailBody, string[] toEmailAddresses, string[] ccEmailAddresses)
        {
            SendEmailService sendEmailService = new SendEmailService();
            sendEmailService.EmailSubject = mailSubject;
            sendEmailService.EmailBody = mailBody;
            sendEmailService.ToEmailAddresses = toEmailAddresses;
            sendEmailService.CCEmailAddresses = ccEmailAddresses;
            sendEmailService.SendEmail();
        }


        public async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Service Started.");

            await Task.CompletedTask;
        }

        private async void SendEmailNotifications(object state)
        {
            if (isFlag)
            {
                isFlag = false;

                if (ApplicationSettings.Current.RunJobs && JobSettings.Current.SendEmialJob)
                {
                    List<EmailDetails> pendingEmails = await sendEmailApplication.GetPendingEmails();
                    await SendEmailNotification(pendingEmails);
                }
            }
            isFlag = true;

        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
