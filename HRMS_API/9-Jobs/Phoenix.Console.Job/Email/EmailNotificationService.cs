using Microsoft.Extensions.Hosting;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Model.Business.SendEmailNotification;
using System.Net.Mail;
using System.Net;
using System.Threading;
using System.ComponentModel;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Console.Job.Email
{
    public class EmailNotificationService : IEmailNotificationService, IHostedService
    {
        private readonly ISendEmailApplication sendEmailApplication;
        private readonly ILoggerManager logger;

        public Timer EmailTimer { get; set; }

        public EmailNotificationService(ISendEmailApplication sendEmailApplication, ILoggerManager logger)
        {
            this.sendEmailApplication = sendEmailApplication;
            this.logger = logger;
        }

        public async Task SendEmailNotification(List<EmailDetails> pendingEmails)
        {
            //if (ApplicationSettings.Current.StopAllJobs != 1)
            //{
            //    foreach (var item in pendingEmails)
            //    {
            //        MailMessage message = new MailMessage();
            //        SmtpClient smtp = new SmtpClient();
            //        smtp.SendCompleted += OnEmailSentComplete;
            //        if (ApplicationSettings.Current.Environment == "DEV")
            //        {

            //        }
            //        else
            //        {
            //            if (item.FROMEMPLOYEEEMAIL != "NA")
            //            {
            //                message.From = new MailAddress(item.FROMEMPLOYEEEMAIL);
            //                string[] toEmailAddresses = item.TOEMPLOYEEEMAIL.Split(";", StringSplitOptions.RemoveEmptyEntries);
            //                string[] ccEmailAddresses = item.CCEMPLOYEEEMAIL.Split(";", StringSplitOptions.RemoveEmptyEntries);
            //                foreach (var toaddress in toEmailAddresses)
            //                {
            //                    if (toaddress != "NA")
            //                    {
            //                        message.To.Add(new MailAddress(toaddress));
            //                    }
            //                }
            //                foreach (var ccaddress in ccEmailAddresses)
            //                {
            //                    if (ccaddress != "NA")
            //                    {
            //                        message.CC.Add(ccaddress);
            //                    }
            //                }
            //                if (message.To.Count > 0)
            //                {
            //                    message.Subject = item.SUBJECT;
            //                    message.IsBodyHtml = true; //to make message body as html  
            //                    message.Body = item.EMAILBODY;
            //                    smtp.Port = MailSettings.Current.Port;
            //                    smtp.Host = MailSettings.Current.Host; //for gmail host  
            //                    smtp.EnableSsl = MailSettings.Current.EnableSsl == 1;
            //                    smtp.UseDefaultCredentials = MailSettings.Current.UseDefaultCredentials == 1;
            //                    smtp.Credentials = new NetworkCredential(MailSettings.Current.FromEmail, MailSettings.Current.Password);
            //                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            //                    smtp.SendAsync(message, item.LEAVEEMAILID);
            //                }

            //            }
            //        }
            //    }

            //    List<int> seletedLeaveIds = pendingEmails.Select(x => x.LEAVEEMAILID).ToList();
            //    if (seletedLeaveIds.Count > 0)
            //    {
            //        await sendEmailApplication.UpdateMailSentStatus(seletedLeaveIds);
            //    }
            //}
        }

        private void OnEmailSentComplete(object sender, AsyncCompletedEventArgs e)
        {
            //throw new NotImplementedException();
        }

        public async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Service Started.");

            EmailTimer = new Timer(SendEmailNotifications, null, TimeSpan.Zero, TimeSpan.FromSeconds(60));
            await Task.CompletedTask;
        }

        private async void SendEmailNotifications(object state)
        {
            List<EmailDetails> pendingEmails = await sendEmailApplication.GetPendingEmails();
            await SendEmailNotification(pendingEmails);


        }

        public async Task StopAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Service Stopped.");
            EmailTimer?.Dispose();
            await Task.CompletedTask;
        }



    }
}
