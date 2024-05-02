using Microsoft.Extensions.Hosting;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Model.Business.SendEmailNotification;
using System.Collections.Generic;
using System.ComponentModel;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;
using System.Threading;
using System;
using System.Linq;
using Phoenix.Model.Business.Employee;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;
using Phoenix.Web.Service.Helper.AwsEmailService;

namespace Phoenix.Web.Service.HostedService
{
    public class GenerateEmailOTPService : IHostedService
    {
        private readonly ILoggerManager logger;
        private readonly ISendEmailApplication sendEmailApplication;
        private readonly Timer EmailTimer;
        private bool isFlag = true;
        public GenerateEmailOTPService(ILoggerManager logger, ISendEmailApplication sendEmailApplication)
        {
            this.logger = logger;
            this.sendEmailApplication = sendEmailApplication;
            EmailTimer = new Timer(SendOTPEmailNotification, null, TimeSpan.Zero, TimeSpan.FromSeconds(60));
        }
        public async Task SendOTPEmailNotification(List<EmailOtpVerification> pendingEmails)
        {

            List<string> toEmailAddresses = null;

            if (ApplicationSettings.Current.RunJobs && JobSettings.Current.SendOTPEmail)
            {
                if (ApplicationSettings.Current.Environment.ToUpper() == "PROD")
                {
                    foreach (var item in pendingEmails)
                    {
                        toEmailAddresses = item.ToEmployeeEmail.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();

                        await SendEmail(item.Subject, item.Emailbody, toEmailAddresses.ToArray());
                    }
                }
                else
                {
                    foreach (var item in pendingEmails)
                    {
                        toEmailAddresses = item.ToEmployeeEmail.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();

                        await SendEmail(item.Subject, item.Emailbody, toEmailAddresses.ToArray());
                    }
                }
            }
            isFlag = true;
        }
        private async Task SendEmail(string mailSubject, string mailBody, string[] toEmailAddresses)
        {
            SendEmailService sendEmailService = new SendEmailService();
            sendEmailService.EmailSubject = mailSubject;
            sendEmailService.EmailBody = mailBody;
            sendEmailService.ToEmailAddresses = toEmailAddresses;
            sendEmailService.SendEmail();
        }
        private void OnEmailSentComplete(object sender, AsyncCompletedEventArgs e)
        {
        }

        public async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Service Started.");

            await Task.CompletedTask;
        }

        private async void SendOTPEmailNotification(object state)
        {
            if (isFlag)
            {
                isFlag = false;

                if (ApplicationSettings.Current.RunJobs && JobSettings.Current.SendOTPEmail)
                {
                    List<EmailOtpVerification> pendingEmails = await sendEmailApplication.GetPendingOTPEmails();
                    if (JobSettings.Current.SendOTPEmail && pendingEmails.Count > 0)
                    {
                        await SendOTPEmailNotification(pendingEmails);
                    }
                }
                else
                {
                    isFlag = true;
                }
            }

        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
