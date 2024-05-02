using Phoenix.Model.Business.Form16;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.Form16.Interfaces
{
    public interface IForm16Application
    {
        Task<List<TaxDocuments>> GetForm16(string panNo);
        Task<byte[]> DownLoadForm16(YearWiseTaxDocument taxDocument);
        Task<bool> UpdateItrUploads(UploadITRFile uploadITRFile);
        Task<bool> UpdateITRApprovalStatus(UpdateITRUploadStatus req);
        Task<List<GetITRFile>> GetMyITRDetails(int EmployeeSlno);
    }
}
