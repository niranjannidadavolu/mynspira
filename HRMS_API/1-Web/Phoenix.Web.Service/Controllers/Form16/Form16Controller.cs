using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Phoenix.Application.Form16.Interfaces;
using Phoenix.Model.Business.Form16;

using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Web.Service.Base;
using Microsoft.Reporting.NETCore;
using Phoenix.CrossCutting.Helper.Constants;

namespace Phoenix.Web.Service.Controllers.Form16
{
    [Route("api/[controller]")]
    [ApiController]
    public class Form16Controller : BaseApiController
    {
        private readonly IForm16Application form16Application;
        private IConfiguration configuration { get; }

        public Form16Controller(IForm16Application form16Application, IConfiguration configuration)
        {
            this.form16Application = form16Application;
            this.configuration = configuration;
        }

        [Authorize]
        [HttpGet]
        [Route("GetForm16")]
        public async Task<List<TaxDocuments>> GetForm16(string panNo)
        {
            using var report = new LocalReport();
            List<TaxDocuments> form16Data = await form16Application.GetForm16(panNo);
            return form16Data;
        }

        [Authorize]
        [HttpPost]
        [Route("DownLoadForm16")]
        public async Task<dynamic> DownLoadForm16(YearWiseTaxDocument taxDocument)
        {         
            byte[] form16Byte = await form16Application.DownLoadForm16(taxDocument);
            return File(form16Byte, Constants.PDFMIMETYPE, Constants.PDFEXTENSION);
        }
        [Authorize]
        [HttpPost]
        [Route("UpdateItrUploads")]
        public async Task<bool> UpdateItrUploads(UploadITRFile uploadITRFile)
        {
            bool file = await form16Application.UpdateItrUploads(uploadITRFile);
            return file;
        }
        [Authorize]
        [HttpPut]
        [Route("UpdateITRApprovalStatus")]
        public async Task<bool> UpdateITRApprovalStatus(UpdateITRUploadStatus req)
        {
            bool form16Byte = await form16Application.UpdateITRApprovalStatus(req);
            return form16Byte;
        }

        [Authorize]
        [HttpGet]
        [Route("GetMyITRDetails")]
        public async Task<List<GetITRFile>> GetMyITRDetails(int EmployeeSlno)
        {
            List<GetITRFile> form16Byte = await form16Application.GetMyITRDetails(EmployeeSlno);
            return form16Byte;
        }
    }
}
