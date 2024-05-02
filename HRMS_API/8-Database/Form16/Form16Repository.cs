using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.Form16;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Phoenix.CrossCutting.Enumerations.Enumerations;
using System.Net;
using Phoenix.Model.Business.Employee;
using System.IO;
using Phoenix.Model.Business.LeaveManagement;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Newtonsoft.Json.Linq;
using System.Collections.Specialized;
using System.Data.SqlClient;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.Model.Business.InvestmentProofs;

namespace Phoenix.Database.Repository.Form16
{
    public class Form16Repository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public Form16Repository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<TaxDocuments>> GetForm16(string panNo)
        {
            string imagePath = string.Empty;
            List<YearWiseTaxDocument> form16Documents = null;
            List<TaxDocuments> taxDouments = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iPanNo", panNo, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                form16Documents = (await connection.QueryAsync<YearWiseTaxDocument>(DatabaseProcedures.FORM_16_DOWNLOAD, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }

            imagePath = ApplicationSettings.Current.ImagePath.ToString();

            if (form16Documents.Any())
            {
                taxDouments = new List<TaxDocuments>();

                var results = from p in form16Documents
                              group p by p.FinYear into g
                              select new { Year = g.Key, TaxDocuments = g.ToList() };

                foreach (var item in results)
                {
                    TaxDocuments taxDocument = new TaxDocuments();
                    taxDocument.FinYear = item.Year;
                    taxDocument.YearWiseTaxDocuments = item.TaxDocuments;
                    taxDouments.Add(taxDocument);
                }
            }
            return taxDouments;
        }

        public async Task<byte[]> DownLoadForm16(YearWiseTaxDocument taxDocument)
        {
            string imagePath = ApplicationSettings.Current.ProfilePath.ToString();
            string[] fileData = taxDocument.FilePath.Split('\\');
            if (fileData != null && fileData.Length > 0)
            {
                fileData[0] = imagePath;
            }
            string filePath = string.Join('/', fileData);
            StringBuilder strBuilder = new StringBuilder();
            strBuilder.Append(filePath);
            Uri uri = new Uri(strBuilder.ToString());
            byte[] response = new WebClient().DownloadData(uri.AbsoluteUri);
            return response;
        }
      
        public async Task<bool> UpdateItrUploads(UploadITRFile uploadITRFile)
        {
            bool resp = false;
            int recordsUpdated = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await UploadItrFileToDirectory(uploadITRFile);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iEMPLOYEESLNO", uploadITRFile.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iITRNUMBER", uploadITRFile.ItrNumber, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iYEAR", uploadITRFile.Year, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iREMARKS", uploadITRFile.Remarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                   //aram.Add(name: "iSTATUS", uploadITRFile.Status, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME", uploadITRFile.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAMEORIGINAL", uploadITRFile.FileName_Original, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILEPATH", uploadITRFile.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_ITR_EMP_FILEUPLOAD, param, commandType: CommandType.StoredProcedure);
                }
                resp = (recordsUpdated * -1) > 0;
            }
            return resp;
        }
        private async Task<bool> UploadItrFileToDirectory(UploadITRFile uploadITRFile)
        {
            if (uploadITRFile != null)
            {
                string filePath = Path.Combine(ApplicationSettings.Current.ITRUploadDetailsPath);
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string fileType = Path.GetExtension(uploadITRFile.FileToUpload.FileName).ToString().ToLower();
                string fileName = string.Format("{0}_{1}{2}", uploadITRFile.ItrNumber, DateTime.Now.Ticks, fileType);
                filePath = Path.Combine(filePath, fileName);

                if (!File.Exists(filePath))
                {
                    string base64String = uploadITRFile.FileToUpload.FileAsBase64.Substring(uploadITRFile.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                    byte[] imageBytes = Convert.FromBase64String(base64String);
                    File.WriteAllBytes(filePath, imageBytes);
                    uploadITRFile.FilePath = filePath;
                    uploadITRFile.FileName = fileName;
                }
            }
            return true;
        }
        public async Task<bool> UpdateITRApprovalStatus(UpdateITRUploadStatus req)
        {
            bool resp = false;
            int updatedRecords = 0;

            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters param = new();
                param.Add(name: "IITRID", req.ItrId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "ISTATUSID", req.StatusId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IEMPLOYEESLNO", req.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IAPPROVED_BY", req.ApprovedBy, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                param.Add(name: "IAPPROVED_REMARKS", req.ApprovedRemarks, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_UPDATE_EMP_ITR_STATUS, param, commandType: CommandType.StoredProcedure);

                resp = (updatedRecords * -1) > 0;
            }
            return resp;

        }

        public async Task<List<GetITRFile>> GetMyITRDetails(int EmployeeSlno)
        {
            List<GetITRFile> res = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iEMPLOYEESLNO", EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);

                res = (await connection.QueryAsync<GetITRFile>(DatabaseProcedures.SP_GET_ITR_UPLOADS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
                foreach (var item in res)
                {
                    item.FilePath = await ConvertFileUri(item.FilePath);
                }
            }
            return res;
        }

        public async Task<string> ConvertFileUri(string FilePath)
        {
            string imagePath = ApplicationSettings.Current.ProfilePath.ToString();
            string[] fileData = FilePath.Split('\\');
            if (fileData != null && fileData.Length > 0)
            {
                fileData[0] = imagePath;
            }
            string filePath = string.Join('/', fileData);
            return filePath;
        }
    }
}
