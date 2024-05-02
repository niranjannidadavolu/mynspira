using Microsoft.CodeAnalysis.VisualBasic.Syntax;
using Microsoft.Extensions.Caching.Distributed;
using Microsoft.Extensions.Configuration;
using Phoenix.Database.Repository.PMS;
using Phoenix.Domain.PMS.Interfaces;
using Phoenix.Model.Business.PMS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Phoenix.Domain.Base;

namespace Phoenix.Domain.PMS.Implementations
{
    public class KraInformationDomain : BaseDomain, IKraInformationDomain
    {
        private readonly IConfiguration configuration;
        private readonly IDistributedCache redisCache;

        public KraInformationDomain(IConfiguration configuration, IDistributedCache redisCache) : base(configuration, redisCache)
        {
            this.configuration = configuration;
            this.redisCache = redisCache;
        }

        public async Task<List<KraInformation>> GetAllKraInformations()
        {
            List<KraInformation> kraInformations = null; 
            using (KraInformationRepositry kraRepository = new KraInformationRepositry(this.configuration, this.redisCache))
            {
                kraInformations = await kraRepository.GetAllKraInformations();
            }
            return kraInformations;
        }

        public async Task<bool> SaveKraInformation(KraInformation kraInformation)
        {
            bool isSaved = false;
            using (KraInformationRepositry kraRepository = new KraInformationRepositry(this.configuration, this.redisCache))
            {
                isSaved = await kraRepository.SaveKraInformation(kraInformation);
            }
            return isSaved;
        }
        public async Task<bool> DeleteKRAInformation(string kraSlno)
        {
            bool isDeleted = false;
            using (KraInformationRepositry kraRepository = new KraInformationRepositry(this.configuration, this.redisCache))
            {
                isDeleted = await kraRepository.DeleteKRAInformation(kraSlno);
            }
            return isDeleted;
        } 

        public async Task<bool> CheckDuplicateKra(int kraSlno, string kraName)
        {
            bool isDeleted = false;
            using (KraInformationRepositry kraRepository = new KraInformationRepositry(this.configuration, this.redisCache))
            {
                isDeleted = await kraRepository.CheckDuplicateKra(kraSlno, kraName);
            }
            return isDeleted;
        }

        public async Task<List<DesignationKraInformation>> GetAllPendingInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            using (KraInformationRepositry kraRepository = new KraInformationRepositry(this.configuration, this.redisCache))
            {
                kraInformations = await kraRepository.GetAllPendingInitiationReviews();
            }
            return kraInformations;
        }

        public async Task<List<DesignationKraInformation>> GetAllFinalInitiationReviews()
        {
            List<DesignationKraInformation> kraInformations = null;
            using (KraInformationRepositry kraRepository = new KraInformationRepositry(this.configuration, this.redisCache))
            {
                kraInformations = await kraRepository.GetAllFinalInitiationReviews();
            }
            return kraInformations;
        }
    }
}
