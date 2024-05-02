using System;
using Phoenix.Model.Business.PMS;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace Phoenix.Application.PMS.Interfaces
{
    public interface IKraInformationApplication
    {
        Task<bool> SaveKraInformation(KraInformation KraInformation);
        Task<List<KraInformation>> GetAllKraInformations();
        Task<bool> DeleteKRAInformation(string KraSlno);


        Task<bool> CheckDuplicateKra(int kraSlno, string kraName);
        Task<List<DesignationKraInformation>> GetAllPendingInitiationReviews();
        Task<List<DesignationKraInformation>> GetAllFinalInitiationReviews();

    }
}
