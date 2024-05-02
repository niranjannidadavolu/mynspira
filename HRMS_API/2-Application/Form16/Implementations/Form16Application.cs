
using Phoenix.Application.Form16.Interfaces;
using Phoenix.Domain.Form16.Interfaces;
using Phoenix.Model.Business.Form16;

using System.Collections.Generic;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Phoenix.Application.Form16.Implementations
{
    public class Form16Application: IForm16Application
    {
        private readonly IForm16Domain form16Domain;
        public Form16Application(IForm16Domain form16Domain)
        {
            this.form16Domain = form16Domain;
        }

        public async Task<List<TaxDocuments>> GetForm16(string panNo)
        {
            List<TaxDocuments> form16 = await form16Domain.GetForm16(panNo);
            return form16;
        }
        public async Task<byte[]> DownLoadForm16(YearWiseTaxDocument taxDocument)
        {
            byte[] form16 = await form16Domain.DownLoadForm16(taxDocument);
            return form16;
        }
        public async Task<bool> UpdateItrUploads(UploadITRFile uploadITRFile)
        {
            bool details = await form16Domain.UpdateItrUploads(uploadITRFile);
            return details;
        }
        public async Task<bool> UpdateITRApprovalStatus(UpdateITRUploadStatus req)
        {
            bool data = await form16Domain.UpdateITRApprovalStatus(req);
            return data;
        }
        public async Task<List<GetITRFile>> GetMyITRDetails(int EmployeeSlno)
        {
            List<GetITRFile> data = await form16Domain.GetMyITRDetails(EmployeeSlno);
            return data;
        }
    }
}
