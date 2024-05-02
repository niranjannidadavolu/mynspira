using Phoenix.Model.Business.HelpDocuments;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.HelpDocuments.Interfaces
{
    public interface IHelpDocumentsApplication
    {
        Task<List<HelpDocument>> GetActiveHelpDocs(int officeTypeSLNO);
        Task<byte[]> DownloadDocument(HelpDocument helpDocument);
    }
}
