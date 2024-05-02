using Microsoft.AspNetCore.Mvc;
using Phoenix.Web.Service.Helper;
using Phoenix.Application.HelpDocuments.Interfaces;
using Phoenix.Model.Business.HelpDocuments;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.IO;
using Phoenix.Web.Service.Base;
using Phoenix.CrossCutting.Helper.Constants;

namespace Phoenix.Web.Service.Controllers.HelpDocuments
{
    [Route("api/[controller]")]
    [ApiController]
    public class HelpDocumentsController : BaseApiController
    {
        private readonly IHelpDocumentsApplication helpDocumentsApplication;
        public HelpDocumentsController(IHelpDocumentsApplication helpDocumentsApplication)
        {
            this.helpDocumentsApplication = helpDocumentsApplication;
        }

        [HttpGet]
        [Route("GetActiveHelpDocs")]    
        public async Task<List<HelpDocument>> GetActiveHelpDocs(int officeTypeSLNO)
        {            
            List<HelpDocument> helpDocs = await helpDocumentsApplication.GetActiveHelpDocs(officeTypeSLNO);
            return helpDocs;
        }

        [Authorize]
        [HttpPost]
        [Route("DownloadDocument")]
        public async Task<IActionResult> DownloadDocument([FromBody] HelpDocument helpDocument)
        {
            string fileName = helpDocument?.FileName;
            FileInfo fileInfo = new FileInfo(fileName);

            string fileExtension = fileInfo.Extension == ".docx" ? Constants.WORDEXTENSION : fileInfo.Extension;
            string fileMimeType = fileInfo.Extension == ".docx" ? Constants.WORDMIMETYPE : Constants.PDFMIMETYPE;

            byte[] documentData = await helpDocumentsApplication.DownloadDocument(helpDocument);
            return File(documentData, fileMimeType, fileExtension);
        }
    }
}
