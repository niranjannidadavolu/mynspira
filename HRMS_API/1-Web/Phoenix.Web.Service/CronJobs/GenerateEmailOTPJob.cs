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
using Phoenix.Model.Business.Employee;
using Phoenix.Web.Service.Helper.AwsEmailService;

namespace Phoenix.Web.Service.CronJobs
{
    public class GenerateEmailOTPJob : CronJobService
    {
        private readonly ILoggerManager logger;
        private readonly ISendEmailApplication sendEmailApplication;
        private bool isFlag = true;

        public GenerateEmailOTPJob(IScheduleConfig<EmailNotificationJob> config, ILoggerManager logger, ISendEmailApplication sendEmailApplication)
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
                isFlag = false;
                List<EmailOtpVerification> pendingEmails = await sendEmailApplication.GetPendingOTPEmails();
                if (JobSettings.Current.SendOTPEmail && pendingEmails.Count > 0)
                {
                    await SendOTPEmailNotification(pendingEmails);
                }
                else
                {
                    isFlag = true;
                }
            }
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Notification Job Stopping.");
            await base.StopAsync(cancellationToken);
        }

        public async Task SendOTPEmailNotification(List<EmailOtpVerification> pendingEmails)
        {

            List<string> toEmailAddresses = null;

            if (JobSettings.Current.SendOTPEmail)
            {
                foreach (var item in pendingEmails)
                {
                    toEmailAddresses = item.ToEmployeeEmail.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();

                    await SendEmail(item.Subject, item.Emailbody, item.FromEmployeeEmail, toEmailAddresses.ToArray());
                }
            }
            isFlag = true;
        }

        private async Task SendEmail(string mailSubject, string mailBody, string fromEmailAddress, string[] toEmailAddresses)
        {
            SendEmailService sendEmailService = new SendEmailService();
            sendEmailService.EmailSubject = mailSubject;
            sendEmailService.EmailBody = mailBody;
            sendEmailService.ToEmailAddresses = toEmailAddresses;
            sendEmailService.CCEmailAddresses = new List<string>() { fromEmailAddress }.ToArray();
            sendEmailService.SendEmail();
        }


    }
}
