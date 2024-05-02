using Amazon.Runtime;
using Amazon;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using System.Linq;
using Amazon.SimpleEmail.Model;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.String.zzzRegexPattern;
using MailKit;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;

namespace Phoenix.Web.Service.Helper.AwsEmailService
{
    public class SendEmailService
    {
        public string[] ToEmailAddresses { get; set; }
        public string[] CCEmailAddresses { get; set; }
        public string EmailSubject { get; set; }
        public string EmailBody { get; set; }
        public string AWSAccessKey { get; }
        public string AWSSecretKey { get; }

        private readonly RegionEndpoint region;
        private readonly BasicAWSCredentials creds;
        private readonly string SMTP_USERNAME;
        private readonly string SMTP_PASSWORD;
        private readonly string HOST;
        private readonly int PORT;
        private readonly bool EnableSsl;
        private readonly string FromEmailAddress;
        private readonly string FROMNAME;

        public SendEmailService()
        {
            AWSAccessKey = AwsEmailSettings.Current.UserName;
            AWSSecretKey = AwsEmailSettings.Current.Password;
            region = RegionEndpoint.APSouth1;
            creds = new BasicAWSCredentials(AWSAccessKey, AWSSecretKey);
            SMTP_USERNAME = AWSAccessKey;
            SMTP_PASSWORD = AWSSecretKey;
            HOST = AwsEmailSettings.Current.Host;
            PORT = AwsEmailSettings.Current.Port;
            EnableSsl = true;
            FromEmailAddress = AwsEmailSettings.Current.FromEmail;
            FROMNAME = "NPORTAL";
        }
        //public async Task SendEmail()
        //{
        //    try
        //    {
        //        RawMessage rawMessage = new RawMessage();
        //        MailMessage message = new MailMessage();
        //        message.IsBodyHtml = true;
        //        message.From = new MailAddress(FromEmailAddress, FROMNAME);
        //        message.Subject = EmailSubject;
        //        message.Body = EmailBody;
        //        foreach (var s in from string s in ToEmailAddresses
        //                          where s.IsValidEmail()
        //                          select s)
        //        {
        //            message.To.Add(new MailAddress(s));
        //        }
        //        foreach (var s in from string s in CCEmailAddresses
        //                          where s.IsValidEmail()
        //                          select s)
        //        {
        //            message.CC.Add(new MailAddress(s));
        //        }
        //        if (message.To.Count > 0)
        //        {
        //            using (var client = new SmtpClient(HOST, PORT))
        //            {
        //                client.Credentials =new NetworkCredential(SMTP_USERNAME, SMTP_PASSWORD);
        //                client.EnableSsl = EnableSsl;
        //                await client.SendMailAsync(message);
        //            }

        //        }
        //    }
        //    catch (System.Exception ex)
        //    {


        //    }
        //}

        public void SendEmail()
        {
            try
            {
                var email = new MimeMessage();
                email.From.Add(new MailboxAddress(FROMNAME, ""));
                foreach (var s in from string s in ToEmailAddresses
                                  where s.IsValidEmail()
                                  select s)
                {
                    email.To.Add(MailboxAddress.Parse(s));
                }

                if (CCEmailAddresses != null)
                {
                    foreach (var s in from string s in CCEmailAddresses
                             where s.IsValidEmail()
                             select s)
                    {
                        email.Cc.Add(MailboxAddress.Parse(s));
                    }
                }

                email.Subject = EmailSubject;
                var builder = new BodyBuilder();
                builder.HtmlBody = EmailBody;
                email.Body = builder.ToMessageBody();
                using var smtp = new SmtpClient();
                smtp.Connect(HOST, PORT, SecureSocketOptions.StartTls);
                smtp.Authenticate(AWSAccessKey, AWSSecretKey);
                var k = smtp.SendAsync(email);
                var y = k.Result.ToString();
            }
            catch (System.Exception ex)
            {


            }
        }
    }
}
