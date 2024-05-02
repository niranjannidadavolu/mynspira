using Microsoft.Extensions.Configuration;

using Phoenix.Database.Repository.HelpDocuments;
using Phoenix.Domain.HelpDocuments.Interfaces;

using Phoenix.Model.Business.HelpDocuments;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Domain.HelpDocuments.Implementations
{
    public class HelpDocumentsDomain : IHelpDocumentsDomain
    {
        private readonly IConfiguration configuration;
        public HelpDocumentsDomain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public async Task<byte[]> DownloadDocument(HelpDocument helpDocument)
        {
            byte[] documentData = null;
            using (HelpDocumentsRepository helpDocumentRepository = new(configuration))
            {
                documentData = await helpDocumentRepository.DownloadDocument(helpDocument);
            }
            return documentData;
        }

        public async Task<List<HelpDocument>> GetActiveHelpDocs(int officeTypeSLNO)
        {
            List<HelpDocument> helpDocuments = null;
            using (HelpDocumentsRepository helpDocumentRepository = new(configuration))
            {
                helpDocuments = await helpDocumentRepository.GetActiveHelpDocs(officeTypeSLNO);
            }
            return helpDocuments;
        }
    }
}
