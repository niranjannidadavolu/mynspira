using Dapper;
using Dapper.Oracle;
using Microsoft.Extensions.Configuration;
using Microsoft.ReportingServices.ReportProcessing.ReportObjectModel;
using Phoenix.CrossCutting.Resources;
using Phoenix.Infrastructure.Dapper;
using Phoenix.Model.Business.HelpDocuments;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using static Phoenix.CrossCutting.Enumerations.Enumerations;

namespace Phoenix.Database.Repository.HelpDocuments
{
    public class HelpDocumentsRepository : BaseRepository
    {
        private readonly IConfiguration configuration;
        public HelpDocumentsRepository(IConfiguration configuration) : base(configuration)
        {
            this.configuration = configuration;
        }

        public async Task<List<HelpDocument>> GetActiveHelpDocs(int officeTypeSLNO)
        {
            StringBuilder imagesPath = new StringBuilder();
            string[] imagePath = null;
            List<HelpDocument> helpDocuments = null;
            using (var connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                OracleDynamicParameters parameters = new OracleDynamicParameters();
                parameters.Add(name: "iOFFICETYPESLNO", officeTypeSLNO, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                parameters.Add(name: "DATACUR", dbType: OracleMappingType.RefCursor, direction: ParameterDirection.Output);
                helpDocuments = (await connection.QueryAsync<HelpDocument>(DatabaseProcedures.SP_GET_HELP_DOCUMENTS, parameters, commandType: CommandType.StoredProcedure)).ToList();
                helpDocuments = helpDocuments.OrderByDescending(x => x.HelpDocumentSlno).ToList();

                foreach (var item in helpDocuments)
                {
                    //apps.narayanagroup.org//HelpDocs/CoachingCenters/Coaching_Centre_Leave_Policy_V01072022.pdf
                    imagesPath.Clear();
                    item.FilePath = item.FilePath.Replace("//apps.narayanagroup.org/", ApplicationSettings.Current.ProfilePath);
                    //imagesPath.AppendFormat("{0}/AADHAR/{1}", ApplicationSettings.Current.ProfilePath, imagePath[2]);
                    //employee.AadharPath = imagesPath.ToString();
                }

            }
            return helpDocuments;
        }

        public async Task<bool> SaveHelpDocHistory(HelpDocument helpDocument)
        {
            int EmailsavedRecords = 0;
            OracleDynamicParameters parameters = null;
            using (IDbConnection connection = await base.CreateConnection(DbSchema.PORTAL))
            {
                using (var tran = connection.BeginTransaction())
                {
                    parameters = new OracleDynamicParameters();
                    parameters.Add(name: "iEMPLOYEESLNO", helpDocument.EmployeeSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iHELPDOCSLNO", helpDocument.HelpDocumentSlno, dbType: OracleMappingType.Int32, direction: ParameterDirection.Input);
                    parameters.Add(name: "iACCESSED_DATE", DateTime.Now, dbType: OracleMappingType.Date, direction: ParameterDirection.Input);

                    EmailsavedRecords = await connection.ExecuteAsync(DatabaseProcedures.INSERT_DOWNLOAD_HISTORY, parameters, commandType: CommandType.StoredProcedure);

                    tran.Commit();
                }
            }

            return true;
        }

        public async Task<byte[]> DownloadDocument(HelpDocument helpDocument)
        {
            byte[] response = null;
            if (helpDocument != null)
            {
                await SaveHelpDocHistory(helpDocument);
                string filename = string.Format("http:{0}", helpDocument.FilePath);
                Uri uri = new Uri(filename);
                using (HttpClient client = new HttpClient())
                {
                    response = await client.GetByteArrayAsync(uri.AbsoluteUri);
                }
            }
            return response;
        }



    }
}
