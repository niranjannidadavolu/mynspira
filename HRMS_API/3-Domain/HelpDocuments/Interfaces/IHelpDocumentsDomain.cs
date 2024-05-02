using Phoenix.Model.Business.HelpDocuments;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Domain.HelpDocuments.Interfaces
{
    public interface IHelpDocumentsDomain
    {
        Task<List<HelpDocument>> GetActiveHelpDocs(int officeTypeSLNO);
        Task<byte[]> DownloadDocument(HelpDocument helpDocument);

    }
}
