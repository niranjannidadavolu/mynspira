using Dapper;
using Dapper.Oracle;

using Microsoft.Extensions.Configuration;

using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.InvestmentProofs;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.InvestmentProofs
{
    /// <summary>
    /// InvestmentProofsRepository for investment proofs submission
    /// </summary>
    public class InvestmentProofsRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public InvestmentProofsRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        #region Get investment proofs files details

        public async Task<List<HouseRentAllowanceFile>> GetHouseRentAllowancFiles(int rentPaymentId)
        {
            List<HouseRentAllowanceFile> tdsEmployeeHRADetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSHRASLNO", rentPaymentId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                tdsEmployeeHRADetails = (await connection.QueryAsync<HouseRentAllowanceFile>(CrossCutting.Resources.Investment.P_TDS_EMP_HRA_FILE_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in tdsEmployeeHRADetails)
            {
                StringBuilder imagesPath = new StringBuilder();
                imagesPath.Clear();
                //"\\10.0.4.199\INVESTMENTPROOFS\ChapterVI\1789436637956420220630891.png"
                string[] imagePath = item.FilePath.Split('\\');
                imagesPath.AppendFormat("{0}/INVESTMENTPROOFS\\HRA/{1}", ApplicationSettings.Current.ProfilePath, imagePath[5]);
                item.FilePath = imagesPath.ToString();
            }
            return tdsEmployeeHRADetails;
        }

        public async Task<List<Chapter6FileDetails>> GetChapter6Files(int chapter6DetailId)
        {
            List<Chapter6FileDetails> chapter6FileDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSEMPSHSLNO", chapter6DetailId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                chapter6FileDetails = (await connection.QueryAsync<Chapter6FileDetails>(CrossCutting.Resources.Investment.P_EMP_TDS_SUBHEAD_FILE_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in chapter6FileDetails)
            {
                StringBuilder imagesPath = new StringBuilder();
                imagesPath.Clear();
                //"\\10.0.4.199\INVESTMENTPROOFS\ChapterVI\1789436637956420220630891.png"
                string[] imagePath = item.FilePath.Split('\\');
                imagesPath.AppendFormat("{0}/INVESTMENTPROOFS\\ChapterVI/{1}", ApplicationSettings.Current.ProfilePath, imagePath[ApplicationSettings.Current.Environment == "DEV"?3:5]);
                item.FilePath = imagesPath.ToString();
            }

            return chapter6FileDetails;
        }

        public async Task<List<HouseIncomeFileDetails>> GetHouseIncomeFiles(int houseIncomeDetailId)
        {
            List<HouseIncomeFileDetails> houseIncomeFileDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSEMPHISLNO", houseIncomeDetailId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                houseIncomeFileDetails = (await connection.QueryAsync<HouseIncomeFileDetails>(CrossCutting.Resources.Investment.P_EMP_HOUSEINCOME_FILE_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in houseIncomeFileDetails)
            {
                StringBuilder imagesPath = new StringBuilder();
                imagesPath.Clear();
                //"\\10.0.4.199\INVESTMENTPROOFS\ChapterVI\1789436637956420220630891.png"
                string[] imagePath = item.FilePath.Split('\\');
                imagesPath.AppendFormat("{0}/INVESTMENTPROOFS\\HouseIncome/{1}", ApplicationSettings.Current.ProfilePath, imagePath[ApplicationSettings.Current.Environment == "DEV" ? 3 : 5]);
                item.FilePath = imagesPath.ToString();
            }

            return houseIncomeFileDetails;
        }

        public async Task<List<OtherIncomeFileDetails>> GetOtherIncomeFiles(int otherIncomeDetailId)
        {
            List<OtherIncomeFileDetails> otherIncomeFileDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSEMPOISLNO", otherIncomeDetailId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                otherIncomeFileDetails = (await connection.QueryAsync<OtherIncomeFileDetails>(CrossCutting.Resources.Investment.P_EMP_OTHERINCOME_FILE_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in otherIncomeFileDetails)
            {
                StringBuilder imagesPath = new StringBuilder();
                imagesPath.Clear();
                //"\\10.0.4.199\INVESTMENTPROOFS\ChapterVI\1789436637956420220630891.png"
                string[] imagePath = item.FilePath.Split('\\');
                imagesPath.AppendFormat("{0}/INVESTMENTPROOFS\\OtherIncome/{1}", ApplicationSettings.Current.ProfilePath, imagePath[ApplicationSettings.Current.Environment == "DEV" ? 3 : 5]);
                item.FilePath = imagesPath.ToString();
            }
            return otherIncomeFileDetails;
        }
        public async Task<List<Section80GFileDetails>> GetSection80GFiles(int TDS80GSLNO)
        {
            List<Section80GFileDetails> otherIncomeFileDetails = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDS80GSLNO", TDS80GSLNO, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parmeters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                otherIncomeFileDetails = (await connection.QueryAsync<Section80GFileDetails>(CrossCutting.Resources.Investment.P_EMP_SECTION80G_FILE_DETAILS, parmeters, commandType: CommandType.StoredProcedure)).ToList();
            }
            foreach (var item in otherIncomeFileDetails)
            {
                StringBuilder imagesPath = new StringBuilder();
                imagesPath.Clear();
                //"\\10.0.4.199\INVESTMENTPROOFS\ChapterVI\1789436637956420220630891.png"
                if (ApplicationSettings.Current.Environment == "DEV")
                {
                    if (item.FileName.ToUpper().Contains(".PDF"))
                    {
                        item.FilePath = "https://cdn.syncfusion.com/content/pdf/pdf-succinctly.pdf";
                    }
                    else if (item.FileName.ToUpper().Contains(".PNG") || item.FileName.ToUpper().Contains(".JPG") ||
                             item.FileName.ToUpper().Contains(".JPEG"))
                    {
                        item.FilePath = "https://www.pakainfo.com/wp-content/uploads/2021/09/image-url-for-testing.jpg";
                    }
                }
                else
                {
                    string[] imagePath = item.FilePath.Split('\\');
                    imagesPath.AppendFormat("{0}/INVESTMENTPROOFS\\OtherIncome/{1}", ApplicationSettings.Current.ProfilePath, imagePath[ApplicationSettings.Current.Environment == "DEV" ? 3 : 5]);
                    item.FilePath = imagesPath.ToString();
                }
            }
            return otherIncomeFileDetails;
        }
        #endregion

        #region  Upload file for all sections
        public async Task<bool> UploadHouseRentAllowanceFile(HouseRentAllowanceFile houseRentAllowanceFile)
        {
            bool resp = false;
            int recordsUpdated = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await UploadHRAFileToDirectory(houseRentAllowanceFile);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDSHRASLNO", houseRentAllowanceFile.TdsHRASLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME", houseRentAllowanceFile.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME_ORIGINAL", houseRentAllowanceFile.FileName_Original, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILEPATH", houseRentAllowanceFile.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_HRAFILEUPLOAD, param, commandType: CommandType.StoredProcedure);
                }
                resp = (recordsUpdated * -1) > 0;
            }
            return resp;
        }

        public async Task<bool> UploadChapter6File(Chapter6FileDetails chapter6FileDetails)
        {
            bool resp = false;
            int recordsUpdated = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await UploadChapter6FileToDirectory(chapter6FileDetails);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDSEMPSHSLNO", chapter6FileDetails.TdsEmpSHSLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME", chapter6FileDetails.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME_ORIGINAL", chapter6FileDetails.FileName_Original, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILEPATH", chapter6FileDetails.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);

                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_CHAPTER6_FILEUPLOAD, param, commandType: CommandType.StoredProcedure);
                }
                resp = (recordsUpdated * -1) > 0;
            }
            return resp;
        }

        public async Task<bool> UploadHouseIncomeFile(HouseIncomeFileDetails houseIncomeFileDetails)
        {
            bool resp = false;
            int recordsUpdated = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await UploadHouseIncomeFileToDirectory(houseIncomeFileDetails);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDSEMPHISLNO", houseIncomeFileDetails.TdsEmpHISLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME", houseIncomeFileDetails.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME_ORIGINAL", houseIncomeFileDetails.FileName_Original, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILEPATH", houseIncomeFileDetails.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_HINCOME_FILEUPLOAD, param, commandType: CommandType.StoredProcedure);
                }
                resp = (recordsUpdated * -1) > 0;
            }
            return resp;
        }

        public async Task<bool> UploadOtherIncomeFile(OtherIncomeFileDetails otherIncomeFileDetails)
        {
            
            bool resp = false;
            int recordsUpdated = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await UploadOtherIncomeFileToDirectory(otherIncomeFileDetails);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDSEMPOISLNO", otherIncomeFileDetails.TdsEmpOISLNo, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME", otherIncomeFileDetails.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME_ORIGINAL", otherIncomeFileDetails.FileName_Original, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILEPATH", otherIncomeFileDetails.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_OINCOME_FILEUPLOAD, param, commandType: CommandType.StoredProcedure);
                }
                resp = (recordsUpdated * -1) > 0;
            }
            return resp;
        }
        public async Task<bool> UploadSection80GFile(Section80GFileDetails section80GFileDetails)
        {

            bool resp = false;
            int recordsUpdated = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                bool filsUploadStatus = await UploadSection80GFileToDirectory(section80GFileDetails);
                if (filsUploadStatus)
                {
                    OracleDynamicParameters param = new();
                    param.Add(name: "iTDS80GSLNO", section80GFileDetails.TDS80GSLNO, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME", section80GFileDetails.FileName, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILENAME_ORIGINAL", section80GFileDetails.FileName_Original, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    param.Add(name: "iFILEPATH", section80GFileDetails.FilePath, dbType: OracleMappingType.Varchar2, direction: ParameterDirection.Input);
                    recordsUpdated = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_80G_FILEUPLOAD, param, commandType: CommandType.StoredProcedure);
                }
                resp = (recordsUpdated * -1) > 0;
            }
            return resp;
        }
        private async Task<bool> UploadHRAFileToDirectory(HouseRentAllowanceFile houseRentAllowanceFile)
        {
            if (houseRentAllowanceFile != null)
            {
                string filePath = Path.Combine(ApplicationSettings.Current.HRAInvestmentProofsPath);
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string fileType = Path.GetExtension(houseRentAllowanceFile.FileToUpload.FileName).ToString().ToLower();
                string fileName = string.Format("{0}{1}{2}", houseRentAllowanceFile.TdsHRASLNo, DateTime.Now.Ticks, fileType);
                filePath = Path.Combine(filePath, fileName);

                if (!File.Exists(filePath))
                {
                    string base64String = houseRentAllowanceFile.FileToUpload.FileAsBase64.Substring(houseRentAllowanceFile.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                    byte[] imageBytes = Convert.FromBase64String(base64String);
                    File.WriteAllBytes(filePath, imageBytes);
                    houseRentAllowanceFile.FilePath = filePath;
                    houseRentAllowanceFile.FileName = fileName;
                }
            }
            return true;
        }

        private async Task<bool> UploadChapter6FileToDirectory(Chapter6FileDetails chapter6FileDetails)
        {
            if (chapter6FileDetails != null)
            {
                string filePath = Path.Combine(ApplicationSettings.Current.Chapter6InvestmentProofsPath);
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string fileType = Path.GetExtension(chapter6FileDetails.FileToUpload.FileName).ToString().ToLower();
                string fileName = string.Format("{0}{1}{2}", chapter6FileDetails.TdsEmpSHSLNo, DateTime.Now.Ticks, fileType);
                filePath = Path.Combine(filePath, fileName);

                if (!File.Exists(filePath))
                {
                    string base64String = chapter6FileDetails.FileToUpload.FileAsBase64.Substring(chapter6FileDetails.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                    byte[] imageBytes = Convert.FromBase64String(base64String);
                    File.WriteAllBytes(filePath, imageBytes);
                    chapter6FileDetails.FilePath = filePath;
                    chapter6FileDetails.FileName = fileName;
                }
            }
            return true;
        }

        private async Task<bool> UploadHouseIncomeFileToDirectory(HouseIncomeFileDetails houseIncomeFileDetails)
        {
            if (houseIncomeFileDetails != null)
            {
                string filePath = Path.Combine(ApplicationSettings.Current.HouseIncomeInvestmentProofsfPath);
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string fileType = Path.GetExtension(houseIncomeFileDetails.FileToUpload.FileName).ToString().ToLower();
                string fileName = string.Format("{0}{1}{2}", houseIncomeFileDetails.TdsEmpHISLNo, DateTime.Now.Ticks, fileType);
                filePath = Path.Combine(filePath, fileName);

                if (!File.Exists(filePath))
                {
                    string base64String = houseIncomeFileDetails.FileToUpload.FileAsBase64.Substring(houseIncomeFileDetails.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                    byte[] imageBytes = Convert.FromBase64String(base64String);
                    File.WriteAllBytes(filePath, imageBytes);
                    houseIncomeFileDetails.FilePath = filePath;
                    houseIncomeFileDetails.FileName = fileName;
                }
            }
            return true;
        }

        private Task<bool> UploadOtherIncomeFileToDirectory(OtherIncomeFileDetails otherIncomeFileDetails)
        {
            if (otherIncomeFileDetails != null)
            {
                string filePath = Path.Combine(ApplicationSettings.Current.OtherIncomeInvestmentProofsPath);
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string fileType = Path.GetExtension(otherIncomeFileDetails.FileToUpload.FileName).ToString().ToLower();
                string fileName = string.Format("{0}{1}{2}", otherIncomeFileDetails.TdsEmpOISLNo, DateTime.Now.Ticks, fileType);
                filePath = Path.Combine(filePath, fileName);

                if (!File.Exists(filePath))
                {
                    string base64String = otherIncomeFileDetails.FileToUpload.FileAsBase64.Substring(otherIncomeFileDetails.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                    byte[] imageBytes = Convert.FromBase64String(base64String);
                    File.WriteAllBytes(filePath, imageBytes);
                    otherIncomeFileDetails.FilePath = filePath;
                    otherIncomeFileDetails.FileName = fileName;
                }
            }
            return Task.FromResult(true);
        }
        public Task<bool> UploadSection80GFileToDirectory(Section80GFileDetails section80GFileDetails)
        {
            if (section80GFileDetails != null)
            {
                string filePath = Path.Combine(ApplicationSettings.Current.OtherIncomeInvestmentProofsPath);
                if (!Directory.Exists(filePath))
                {
                    Directory.CreateDirectory(filePath);
                }
                string fileType = Path.GetExtension(section80GFileDetails.FileToUpload.FileName).ToString().ToLower();
                string fileName = string.Format("{0}{1}{2}", section80GFileDetails.TDS80GSLNO, DateTime.Now.Ticks, fileType);
                filePath = Path.Combine(filePath, fileName);

                if (!File.Exists(filePath))
                {
                    string base64String = section80GFileDetails.FileToUpload.FileAsBase64.Substring(section80GFileDetails.FileToUpload.FileAsBase64.IndexOf(',') + 1);
                    byte[] imageBytes = Convert.FromBase64String(base64String);
                    File.WriteAllBytes(filePath, imageBytes);
                    section80GFileDetails.FilePath = filePath;
                    section80GFileDetails.FileName = fileName;
                }
            }
            return Task.FromResult(true);
        }
        
        #endregion  upload documents for all sections

        #region Remove investment proofs files for all sections
        public async Task<bool> RemoveHouseRentAllowanceFile(int hraFileId)
        {
            bool isDeleted = false;
            int updatedRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSHRAFILESLNO", hraFileId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_DELETE_HRAFILE, parmeters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (updatedRecords * -1) > 0;
            return isDeleted;
        }
        public async Task<bool> RemoveChapter6File(int chapter6FileId)
        {
            bool isDeleted = false;
            int updatedRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSEMPSHFILESLNO", chapter6FileId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_DELETE_CHAPTER6FILE, parmeters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (updatedRecords * -1) > 0;
            return isDeleted;
        }   
        public async Task<bool> RemoveHouseIncomeFile(int houseIncomeFileId)
        {
            bool isDeleted = false;
            int updatedRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSEMPHIFILESLNO", houseIncomeFileId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_DELETE_HINCOMEFILE, parmeters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (updatedRecords * -1) > 0;
            return isDeleted;
        }
        public async Task<bool> RemoveOtherIncomeFile(int otherIncomeFileId)
        {
            bool isDeleted = false;
            int updatedRecords = 0;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parmeters = new OracleDynamicParameters();
                parmeters.Add(name: "iTDSEMPOIFILESLNO", otherIncomeFileId, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                updatedRecords = await connection.ExecuteAsync(DatabaseProcedures.SP_TDS_EMP_DELETE_OINCOMEFILE, parmeters, commandType: CommandType.StoredProcedure);
            }
            isDeleted = (updatedRecords * -1) > 0;
            return isDeleted;
        }

       
        #endregion
    }
}
