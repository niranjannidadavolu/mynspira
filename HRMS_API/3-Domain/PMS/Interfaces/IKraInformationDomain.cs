using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.PMS.Interfaces
{
    public interface IKraInformationDomain: IBaseDomain
    {
        Task<bool> SaveKraInformation(KraInformation KraInformation);
        Task<List<KraInformation>> GetAllKraInformations();
        Task<bool> DeleteKRAInformation(string KraSlno);

        Task<bool> CheckDuplicateKra(int kraSlno, string kraName);

        Task<List<DesignationKraInformation>> GetAllPendingInitiationReviews();
        Task<List<DesignationKraInformation>> GetAllFinalInitiationReviews();
    }
}
 