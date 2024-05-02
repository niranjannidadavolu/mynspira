using Microsoft.Extensions.Hosting;
using Phoenix.Application.SendEmailNotification.Implementations;
using Phoenix.Application.SendEmailNotification.Interfaces;
using Phoenix.Model.Business.SendEmailNotification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using System.Text;
using NHibernate.SqlCommand;
using System.IO;
using ClosedXML.Report;
using DocumentFormat.OpenXml.Wordprocessing;
using ClosedXML.Excel;
using System.ComponentModel;
using Phoenix.CrossCutting.Extension.System.String;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Web.Service.HostedService
{
    public class ResignedEmployeesService : IHostedService
    {
        private readonly ILoggerManager logger;
        private readonly IResignedEmployeeApplication resignedEmployeeApplication;
        private readonly Timer EmailTimer;

        private bool isFlag = true;

        TimeSpan timeUntilMidnight = TimeSpan.FromDays(1) - (DateTime.Now - DateTime.Now.Date);
        public ResignedEmployeesService(ILoggerManager logger, IResignedEmployeeApplication resignedEmployeeApplication)
        {
            this.logger = logger;
            this.resignedEmployeeApplication = resignedEmployeeApplication;
            EmailTimer = new Timer(SendResignedEmployees, null, timeUntilMidnight, TimeSpan.FromDays(1));

        }
        public async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Resigned Email Service Started.");

            await Task.CompletedTask;
        }
        public async Task SendResignedEmployee(string fileName)
        {
            try
            {

                if (JobSettings.Current.SendResignedEmployees)
                {
                    logger.LogInfo("Generated File Name :" + fileName);
                    if (JobSettings.Current.ResignedEmployeeJob && fileName != null && ApplicationSettings.Current.Environment.ToUpper() == "PROD")
                    {
                        List<string> toEmailAddresses = null;
                        List<string> ccEmailAddresses = null;
                        StringBuilder subject = new StringBuilder();
                        subject.AppendFormat(ResignedEmailConfiguration.Current.MailSubject, DateTime.Now.ToString("dd'_'MMM'_'yyyy"));

                        toEmailAddresses = ResignedEmailConfiguration.Current.ToEmailAddress.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();
                        ccEmailAddresses = ResignedEmailConfiguration.Current.CcEmailAddress.Split(";", StringSplitOptions.RemoveEmptyEntries).ToList();
                        SendEmail(subject.ToString(), ResignedEmailConfiguration.Current.Emailbody, MailSettings.Current.FromEmail, toEmailAddresses.ToArray(), ccEmailAddresses.ToArray(), fileName);
                    }
                }
            isFlag = true;
            }
            catch (Exception ex)
            {
                logger.LogError("Error While Sedning Mail :: " + ex.Message);
                throw;
            }
        }

        private void SendEmail(string mailSubject, string mailBody, string fromEmailAddress, string[] toEmailAddresses, string[] ccEmailAddresses, string fileName)
        {
            MailMessage message = new MailMessage();
            Attachment attachment = new Attachment(fileName);

            if (fromEmailAddress.IsValidEmail())
            {
                message.Attachments.Add(attachment);
                message.From = new MailAddress(fromEmailAddress);

                foreach (var toaddress in from toaddress in toEmailAddresses
                                          where toaddress.IsValidEmail()
                                          select toaddress)
                {
                    message.To.Add(new MailAddress(toaddress));
                }

                foreach (var ccaddress in from ccaddress in ccEmailAddresses
                                          where ccaddress.IsValidEmail()
                                          select ccaddress)
                {
                    message.CC.Add(ccaddress);
                }

                using (var smtpClient = new SmtpClient(AwsEmailSettings.Current.Host, AwsEmailSettings.Current.Port))
                {
                    smtpClient.Credentials = new NetworkCredential(AwsEmailSettings.Current.UserName, AwsEmailSettings.Current.Password);
                    message.From = new MailAddress(fromEmailAddress);
                    message.Subject = mailSubject;
                    message.IsBodyHtml = true;
                    message.Body = mailBody;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.EnableSsl = true;
                    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpClient.Send(message);
                }
            }
        }
        private async void SendResignedEmployees(object state)
        {
            logger.LogInfo("SendResignedEmployees Started.");
            if (isFlag && JobSettings.Current.ResignedEmployeeJob)
            {
                isFlag = false;
                string directoryName = new StringBuilder().Append($"{DateTime.Now.ToString("dd'_'MMM'_'yyyy")}").ToString();
                string templateFile = Path.Combine(ApplicationSettings.Current.TemplateFilesPath);
                string directoryPath = Path.Combine(ApplicationSettings.Current.DailyOutPutFilePath, directoryName);
                StringBuilder sbFileName = new StringBuilder();
                sbFileName.AppendFormat("ResignedEmployees_{0}.xlsx", DateTime.Now.ToString("dd'_'MMM'_'yyyy"));
                string generatedFileName = sbFileName.ToString();

                var fileName = Path.Combine(directoryPath, generatedFileName);

                List<ResignedEmployee> reportData = await resignedEmployeeApplication.GetResignedEmployees();
                if (reportData != null && reportData.Count > 0)
                {
           
                    logger.LogInfo("Exporting the Report Data to Excel");
                   
                   var response = ExportToExcel(reportData,
                                  directoryPath,
                                  generatedFileName,
                                  templateFile);
                    logger.LogInfo("Completed Exporting the Report Data to Excel.");
                    logger.LogInfo("Sending Attendance Report to the Department Head email.");
                    if (response)
                    {
                        logger.LogInfo(generatedFileName);
                        SendResignedEmployee(fileName);
                    }
                    else
                    {
                        logger.LogWarn("No data found to generate the report.");
                    }
                }
                else
                {
                    logger.LogWarn("No data found to generate the report.");
                    logger.LogWarn("Sendng Empty Data Email.");
                    SendResignedEmployee(fileName);
                }
                logger.LogInfo("Completed Sending Attendance Report to the Department Head email.");
            }
            else
            {
                logger.LogWarn("Unable to Send the email as configuration is restricted to send email.");

            }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }

        public bool ExportToExcel(List<ResignedEmployee> reportData, string directoryPath, string fileName,string templateFile)
        {
            bool response = false;
            try
            {
                Directory.CreateDirectory(directoryPath);
                fileName = Path.Combine(directoryPath, fileName);
                logger.LogInfo(fileName);
                logger.LogInfo(templateFile);

                using (XLTemplate template = new XLTemplate(templateFile))
                {
                    template.AddVariable("ReportHeader", ResignedEmailConfiguration.Current.SentTo);
                    template.AddVariable("ReportDate", DateTime.Now.ToString("dd'_'MMM'_'yyyy"));
                    template.AddVariable("Employee", reportData);

                    template.Generate();
                    template.SaveAs(fileName);
                    template.Dispose();
                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                    GC.Collect();
                    response = true;
                }
                return response;
            }
            catch (Exception ex)
            {
                logger.LogError("Error While Exporting the data to excel :: " + ex.Message);
                throw;
            }
        }

    }
}
