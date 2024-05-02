using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.IO;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.Employee;
using Amazon.S3;
using Amazon;
using iTextSharp.text.pdf;
using Phoenix.Application.EmployeeInformation.Interfaces;
using Microsoft.AspNetCore.Hosting;
using Amazon.S3.Model;
using iTextSharp.text;
using Phoenix.CrossCutting.Extension.System.String;
using Phoenix.CrossCutting.Logging;

namespace Phoenix.Web.Service.HostedService
{
    public class AppointmentLettersService : IHostedService
    {
        private readonly ILoggerManager logger;
        private readonly IAppointmentLetterApplication employeeInformationApplication;
        private readonly Timer EmailTimer;
        readonly IAmazonS3 _s3Client;
        private bool isFlag = true;
        private readonly string rootFilePath;

        TimeSpan timeUntilMidnight = TimeSpan.FromDays(1) - (DateTime.Now - DateTime.Now.Date);
        public AppointmentLettersService(IWebHostEnvironment environment, ILoggerManager logger, IAppointmentLetterApplication employeeInformationApplication)
        {
            this.logger = logger;
            this.employeeInformationApplication = employeeInformationApplication;
            EmailTimer = new Timer(GetPendingAppointmentLetter, null, TimeSpan.Zero, TimeSpan.FromSeconds(10));
            _s3Client = new AmazonS3Client(S3BucketSettings.Current.AccessKey, S3BucketSettings.Current.SecretKey, RegionEndpoint.APSouth1);
            rootFilePath = environment.ContentRootPath;

        }
        public async Task StartAsync(CancellationToken cancellationToken)
        {
            logger.LogInfo("Resigned Email Service Started.");

            await Task.CompletedTask;
        }
        private async void GetPendingAppointmentLetter(object state)
        {
            logger.LogInfo("Appointment Letters generation Started....");
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
                logger.LogWarn("Unable to Send the email as configuration is restricted to send email.");

            }
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

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
