using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Phoenix.CrossCutting.Logging;
using Phoenix.Database.Repository.InvestmentProofs;
using Phoenix.Domain.InvestmentProofs.Interfaces;
using Phoenix.Model.Business.InvestmentProofs;

namespace Phoenix.Domain.InvestmentProofs.Implementations
{
    /// <summary>
    /// InvestmentProofsDomain
    /// </summary>
    public class InvestmentProofsDomain :  IInvestmentProofsDomain
    {
        private readonly IConfiguration configuration;
        public InvestmentProofsDomain(IConfiguration configuration, ILoggerManager logger) 
        {
            this.configuration = configuration;
        }


        #region Get investment proofs all sections files
        public async Task<List<Chapter6FileDetails>> GetChapter6Files(int chapter6DetailId)
        {
            List<Chapter6FileDetails> chapter6FileDetails = null;
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                chapter6FileDetails = await investmentProofsRepository.GetChapter6Files(chapter6DetailId);
            }
            return chapter6FileDetails;
        }

        public async Task<List<HouseIncomeFileDetails>> GetHouseIncomeFiles(int houseIncomeDetailId)
        {
            List<HouseIncomeFileDetails> houseIncomeFileDetails = null;
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                houseIncomeFileDetails = await investmentProofsRepository.GetHouseIncomeFiles(houseIncomeDetailId);
            }
            return houseIncomeFileDetails;
        }

        public async Task<List<HouseRentAllowanceFile>> GetHouseRentAllowancFiles(int rentPaymentId)
        {
            List<HouseRentAllowanceFile> houseRentAllowanceFiles = null;
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                houseRentAllowanceFiles = await investmentProofsRepository.GetHouseRentAllowancFiles(rentPaymentId);
            }
            return houseRentAllowanceFiles; 
        }

        public async Task<List<OtherIncomeFileDetails>> GetOtherIncomeFiles(int otherIncomeDetailId)
        {
            List<OtherIncomeFileDetails> otherIncomeFileDetails = null;
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                otherIncomeFileDetails  = await investmentProofsRepository.GetOtherIncomeFiles(otherIncomeDetailId);
            }
            return otherIncomeFileDetails;
        }
        public async Task<List<Section80GFileDetails>> GetSection80GFiles(int tDS80GSLNO)
        {
            List<Section80GFileDetails> otherIncomeFileDetails = null;
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                otherIncomeFileDetails  = await investmentProofsRepository.GetSection80GFiles(tDS80GSLNO);
            }
            return otherIncomeFileDetails;
        }
        #endregion

        #region  Upload file for all sections
        public async  Task<bool> UploadHouseRentAllowanceFile(HouseRentAllowanceFile houseRentAllowanceFile)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.UploadHouseRentAllowanceFile(houseRentAllowanceFile);
                return resp;
            }
        }
        public async Task<bool> UploadChapter6File(Chapter6FileDetails chapter6FileDetails)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.UploadChapter6File(chapter6FileDetails);
                return resp;
            }
        }
        public async Task<bool> UploadHouseIncomeFile(HouseIncomeFileDetails houseIncomeFileDetails)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.UploadHouseIncomeFile(houseIncomeFileDetails);
                return resp;
            }
        }

        public async Task<bool> UploadOtherIncomeFile(OtherIncomeFileDetails otherIncomeFileDetails)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.UploadOtherIncomeFile(otherIncomeFileDetails);
                return resp;
            }

        }
        public async Task<bool> UploadSection80GFile(Section80GFileDetails section80GFileDetails)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.UploadSection80GFile(section80GFileDetails);
                return resp;
            }
        }
        #endregion

        #region Remove investment proofs files all sections 
        public async Task<bool> RemoveHouseRentAllowanceFile(int hraFileId)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.RemoveHouseRentAllowanceFile(hraFileId);
                return resp;
            }
        }
        public async Task<bool> RemoveChapter6File(int chapter6FileId)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.RemoveChapter6File(chapter6FileId);
                return resp;
            }
        }

        public async Task<bool> RemoveHouseIncomeFile(int houseIncomeFileId)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.RemoveHouseIncomeFile(houseIncomeFileId);
                return resp;
            }
        }
        public async Task<bool> RemoveOtherIncomeFile(int otherIncomeFileId)
        {
            using (InvestmentProofsRepository investmentProofsRepository = new(configuration))
            {
                bool resp = await investmentProofsRepository.RemoveOtherIncomeFile(otherIncomeFileId);
                return resp;
            }
        }  
        #endregion
    }
}
