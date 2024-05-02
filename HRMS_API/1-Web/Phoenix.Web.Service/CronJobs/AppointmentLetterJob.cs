using Phoenix.CrossCutting.Helper.Cron;
using System.Threading.Tasks;
using System.Threading;
using System;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using System.Collections.Generic;
using Phoenix.Application.SendEmailNotification.Interfaces;
using System.Linq;
using Phoenix.Application.EmployeeInformation.Interfaces;
using Amazon.S3;
using Microsoft.AspNetCore.Hosting;
using Amazon;
using Phoenix.Model.Business.Employee;
using Amazon.S3.Model;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using Phoenix.CrossCutting.Extension.System.String;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Web.Service.CronJobs
{
    public class AppointmentLetterJob : CronJobService
    {
        private readonly ILoggerManager logger;
        private readonly IAppointmentLetterApplication employeeInformationApplication;
        private readonly ISendEmailApplication sendEmailApplication;
        private bool isFlag = true;
        readonly IAmazonS3 _s3Client;
        private readonly string rootFilePath;

        public AppointmentLetterJob(IWebHostEnvironment environment, IScheduleConfig<EmailNotificationJob> config, ILoggerManager logger, IAppointmentLetterApplication employeeInformationApplication)
            : base(config.CronExpression, config.TimeZoneInfo)
        {
            this.logger=logger;
            this.employeeInformationApplication=employeeInformationApplication;
            _s3Client = new AmazonS3Client(S3BucketSettings.Current.AccessKey, S3BucketSettings.Current.SecretKey, RegionEndpoint.APSouth1);
            rootFilePath = environment.ContentRootPath;
        }

        public override async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Appointment Letters Job started.");
            await base.StartAsync(cancellationToken);
        }

        public override async Task DoWork(CancellationToken cancellationToken)
        {
            logger.LogInfo(string.Format("{0} : Appointment Letters Job is Working.", DateTime.Now.ToString("T")));
            if (isFlag && JobSettings.Current.CreateAppointmentLetters)
            {
                isFlag = false;
                List<AppointmentLetter> appointmentLetters = await employeeInformationApplication.GetPendingAppointmentLetter();
                foreach (var item in appointmentLetters)
                {
                    await GenerateAppointmentLetter(item);
                }
                isFlag = true;
            }
            else
            {
                logger.LogWarn("Unable to Send the Appointment Letters as configuration is restricted to generate the Appointment Letters.");

            }
        }

        public override async Task StopAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Email Notification Job Stopping.");
            await base.StopAsync(cancellationToken);
        }
        public async Task GenerateAppointmentLetter(AppointmentLetter appointmentLetter)
        {
            string inputFileName;
            string inputFilePath;
            string outputFileName;

            if (ApplicationSettings.Current.AllowedLegalBranches.Contains(appointmentLetter.LegalBranchName))
            {
                Dictionary<string, object> myFormFields = appointmentLetter.MyFormFields;
                inputFileName = $"{appointmentLetter.LegalBranchName}.pdf";
                inputFilePath = Path.Combine(rootFilePath, "Templates", "AppointmentLetters");
                inputFileName = string.Format("{0}\\{1}", inputFilePath, inputFileName);
                outputFileName = string.Format("{0}-{1}", appointmentLetter.EmployeeNumber, "Appointment Letter.pdf");
                outputFileName = string.Format("{0}/{1}/{2}/{3}", S3BucketSettings.Current.EmployeesFolder, appointmentLetter.EmployeeId, "My Documents", outputFileName);
                if (appointmentLetter.AppointmentNumber.IsNotNullOrEmpty())
                {
                    MemoryStream finalStream = SetFieldValues(myFormFields, inputFileName, inputFilePath, appointmentLetter.EmployeeNumber);
                    await UploadFileAsync(finalStream, outputFileName);
                    await UpdateAppointmentLetterStatus(appointmentLetter.EmployeeSlno);
                }
            }
        }

        private async Task UpdateAppointmentLetterStatus(int employeeNumber)
        {
            await employeeInformationApplication.UpdateAppointmentLetterStatus(employeeNumber);
        }

        private MemoryStream SetFieldValues(Dictionary<string, object> fieldData, string templatePath, string outputPath, string employeeNumber)
        {
            Font bold = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 2f, Font.BOLD);
            PdfReader reader = new PdfReader(templatePath);
            var outputFilePath = Path.Combine(outputPath, $"{employeeNumber}-Appointment Letter.pdf").ToString();
            FileStream fs = new FileStream(outputFilePath, FileMode.CreateNew, FileAccess.ReadWrite);
            PdfStamper stamper = new PdfStamper(reader, fs);
            AcroFields fieldStamper = stamper.AcroFields;

            foreach (var data in fieldData)
            {
                fieldStamper.SetFieldProperty(data.Key, "textfont", bold.BaseFont, null);
                fieldStamper.SetField(data.Key, data.Value.ToString());
            }

            stamper.Writer.CompressionLevel = PdfStream.BEST_COMPRESSION;
            stamper.Writer.SetFullCompression();
            stamper.FormFlattening = true;
            stamper.Close();
            fs.Close();
            reader.Close();
            MemoryStream ms = new MemoryStream(File.ReadAllBytes(outputFilePath));
            File.Delete(outputFilePath);
            return ms;

        }
        public async Task<bool> UploadFileAsync(System.IO.Stream inputStream, string fileName)
        {
            try
            {
                inputStream.Seek(0, SeekOrigin.Begin);
                PutObjectRequest request = new PutObjectRequest()
                {
                    InputStream = inputStream,
                    BucketName = S3BucketSettings.Current.BucketName,
                    Key = fileName
                };
                PutObjectResponse response = await _s3Client.PutObjectAsync(request);
                if (response.HttpStatusCode == System.Net.HttpStatusCode.OK)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
