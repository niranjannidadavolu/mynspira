using Microsoft.Extensions.Logging;
using Phoenix.CrossCutting.Helper.Cron;
using System.Threading.Tasks;
using System.Threading;
using System;
using Phoenix.Application.SendEmailNotification.Implementations;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.SendEmailNotification;
using System.Collections.Generic;
using Phoenix.Application.SendEmailNotification.Interfaces;
using System.Linq;
using System.Net.Mail;
using System.Net;
using Phoenix.CrossCutting.Logging;
using Phoenix.Web.Service.Helper.AwsEmailService;

namespace Phoenix.Web.Service.CronJobs
{
    public class EmailNotificationJob : CronJobService
    {
        private readonly ILoggerManager logger;
        private readonly ISendEmailApplication sendEmailApplication;
        private bool isFlag = true;

        public EmailNotificationJob(IScheduleConfig<EmailNotificationJob> config, ILoggerManager logger, ISendEmailApplication sendEmailApplication)
            : base(config.CronExpression, config.TimeZoneInfo)
        {
            this.logger=logger;
            this.sendEmailApplication=sendEmailApplication;
        }

        public override async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Notification Job starts.");
            await base.StartAsync(cancellationToken);
        }

        public override async Task DoWork(CancellationToken cancellationToken)
        {
            logger.LogInfo(string.Format("{0} : Email Notification Job is Working.", DateTime.Now.ToString("T")));
            if (isFlag)
            {
                List<EmailDetails> pendingEmails = await sendEmailApplication.GetPendingEmails();
                if (JobSettings.Current.SendEmialJob && pendingEmails.Count >0)
                {
                    isFlag = false;
                    await SendEmailNotification(pendingEmails);
                }
                isFlag=true;

            }
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Notification Job Stopping.");
            await base.StopAsync(cancellationToken);
        }

        public async Task SendEmailNotification(List<EmailDetails> pendingEmails)
        {
            List<string> toEmailAddresses = null;
            List<string> ccEmailAddresses = null;
            if (JobSettings.Current.SendEmialJob)
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


    }
}
