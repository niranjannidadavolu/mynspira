using Phoenix.Application.HelpDocuments.Interfaces;
using Phoenix.Domain.HelpDocuments.Interfaces;
using Phoenix.Model.Business.HelpDocuments;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.HelpDocuments.Implementations
{
    public class HelpDocumentsApplication: IHelpDocumentsApplication
    {
        private readonly IHelpDocumentsDomain helpDocumentsDomain;
        public HelpDocumentsApplication(IHelpDocumentsDomain helpDocumentsDomain)
        {
            this.helpDocumentsDomain = helpDocumentsDomain;
        }

        public async Task<byte[]> DownloadDocument(HelpDocument helpDocument)
        {
            byte[] documentData = await helpDocumentsDomain.DownloadDocument(helpDocument);
            return documentData;
        }

        public async Task<List<HelpDocument>> GetActiveHelpDocs(int officeTypeSLNO)
        {
            List<HelpDocument> helpDocuments = await helpDocumentsDomain.GetActiveHelpDocs(officeTypeSLNO);
            return helpDocuments;
        }
    }
}
