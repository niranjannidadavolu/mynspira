using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.Form16;
using Phoenix.Domain.Form16.Interfaces;
using Phoenix.Model.Business.Form16;

using System.Collections.Generic;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Phoenix.Domain.Form16.Implementations
{
    public class Form16Domain: IForm16Domain
    {
        private readonly IConfiguration configuration;
        public Form16Domain(IConfiguration configuration)
        {
            this.configuration = configuration;
        }   

        public async Task<List<TaxDocuments>> GetForm16(string panNo)
        {
            using (Form16Repository form16Repository = new(configuration))
            {
                return await form16Repository.GetForm16(panNo);
            }
        }

        public async Task<byte[]> DownLoadForm16(YearWiseTaxDocument taxDocument)
        {
            using (Form16Repository form16Repository = new(configuration))
            {
                return await form16Repository.DownLoadForm16(taxDocument);
            }
        }
        public async Task<bool> UpdateItrUploads(UploadITRFile uploadITRFile)
        {
            using (Form16Repository form16Repository = new(configuration))
            {
                return await form16Repository.UpdateItrUploads(uploadITRFile);
            }
        }
        public async Task<bool> UpdateITRApprovalStatus(UpdateITRUploadStatus req)
        {
            using (Form16Repository form16Repository = new(configuration))
            {
                return await form16Repository.UpdateITRApprovalStatus(req);
            }
        }
        public async Task<List<GetITRFile>> GetMyITRDetails(int EmployeeSlno)
        {
            using (Form16Repository form16Repository = new(configuration))
            {
                return await form16Repository.GetMyITRDetails(EmployeeSlno);
            }
        }
    }
}
