using Microsoft.Extensions.Configuration;
using Phoenix.Application.PMS.Interfaces;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Application.Base;

namespace Phoenix.Application.PMS.Implementations
{
    public class KraInformationApplication : BaseApplication, IKraInformationApplication
    {
        private readonly IConfiguration configuration;
        private readonly IKraInformationDomain KraDomain;

        public KraInformationApplication(IConfiguration configuration, IKraInformationDomain kraDomain) : base(configuration)
        {
            this.configuration = configuration;
            KraDomain = kraDomain;
        }

        public async Task<List<KraInformation>> GetAllKraInformations()
        {
            List<KraInformation> kraInformations = null;
            kraInformations = await this.KraDomain.GetAllKraInformations();
            return kraInformations;
        }

        public async Task<bool> SaveKraInformation(KraInformation KraInformation)
        {
            bool isSaved = false;
            isSaved = await this.KraDomain.SaveKraInformation(KraInformation);
            return isSaved;
        }
        public async Task<bool> DeleteKRAInformation(string kraSlno)
        {
            bool isDeleted = false;
            isDeleted = await this.KraDomain.DeleteKRAInformation(kraSlno);
            return isDeleted;
        }

        public async Task<bool> CheckDuplicateKra(int kraSlno, string kraName)
        {
            bool isDuplicateKra = false;
            isDuplicateKra = await this.KraDomain.CheckDuplicateKra(kraSlno, kraName); 
            return isDuplicateKra;
        }

        public async Task<List<DesignationKraInformation>> GetAllPendingInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            kraInformations = await this.KraDomain.GetAllPendingInitiationReviews();
            return kraInformations;
        }

        public async Task<List<DesignationKraInformation>> GetAllFinalInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            kraInformations = await this.KraDomain.GetAllFinalInitiationReviews();
            return kraInformations;
        }
    }
}
