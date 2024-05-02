using Phoenix.Web.Service.Helper;
using Microsoft.AspNetCore.Mvc;

using Phoenix.Application.InvestmentProofs.Interfaces;
using Phoenix.Model.Business.InvestmentProofs;
using Phoenix.Web.Service.Base;

using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Application.Investment.Implementations;
using Phoenix.Model.Business.Investment;

namespace Phoenix.Web.Service.Controllers.InvestmentProofs
{

    /// <summary>
    /// InvestmentProofsController
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class InvestmentProofsController :  BaseApiController
    {
        private readonly IInvestmentProofsApplication investmentProofsApplication;
        public InvestmentProofsController(IInvestmentProofsApplication investmentProofsApplication)
        {
            this.investmentProofsApplication = investmentProofsApplication;
        }

        #region Get Investment proofs files all the sections

        [Authorize]
        [HttpGet]
        [Route("GetChapter6Files")]
        public async Task<List<Chapter6FileDetails>> GetChapter6Files(int chapter6DetailId)
        {
            List<Chapter6FileDetails> chapter6FileDetails = await investmentProofsApplication.GetChapter6Files(chapter6DetailId);
            return chapter6FileDetails;
        }


        [Authorize]
        [HttpGet]
        [Route("GetHouseIncomeFiles")]
        public async Task<List<HouseIncomeFileDetails>> GetHouseIncomeFiles(int houseIncomeDetailId)
        {
            List<HouseIncomeFileDetails> houseIncomeFileDetails = await investmentProofsApplication.GetHouseIncomeFiles(houseIncomeDetailId);
            return houseIncomeFileDetails;
        }


        [Authorize] 
        [HttpGet]
        [Route("GetHouseRentAllowancFiles")]
        public async Task<List<HouseRentAllowanceFile>> GetHouseRentAllowancFiles(int rentPaymentId)
        {
            List<HouseRentAllowanceFile> houseRentAllowanceFiles = await investmentProofsApplication.GetHouseRentAllowancFiles(rentPaymentId);
            return houseRentAllowanceFiles;
        }

        [Authorize]
        [HttpGet]
        [Route("GetOtherIncomeFiles")]
        public async Task<List<OtherIncomeFileDetails>> GetOtherIncomeFiles(int otherIncomeDetailId)
        {
            List<OtherIncomeFileDetails> otherIncomeFileDetails = await investmentProofsApplication.GetOtherIncomeFiles(otherIncomeDetailId);
            return otherIncomeFileDetails;
        }

        [Authorize]
        [HttpGet]
        [Route("GetSection80GFiles")]
        public async Task<List<Section80GFileDetails>> GetSection80GFiles(int TDS80GSLNO)
        {
            List<Section80GFileDetails> otherIncomeFileDetails = await investmentProofsApplication.GetSection80GFiles(TDS80GSLNO);
            return otherIncomeFileDetails;
        }

        [Authorize]
        [HttpGet]
        [Route("VerifyPanNumber")]
        public async Task<VerifiedPanInformation> VerifyPanNumber(int hraId, string panNumber)
        {
            VerifiedPanInformation taxDeductionDetails = await investmentProofsApplication.VerifyPanNumber(hraId, panNumber);
            return taxDeductionDetails;
        }
        #endregion

        #region  Upload file for all sections

        [Authorize]
        [HttpPost]
        [Route("UploadHouseRentAllowanceFile")]
        public async Task<bool> UploadHouseRentAllowanceFile([FromBody] HouseRentAllowanceFile houseRentAllowanceFile)
        {
            bool resp = await investmentProofsApplication.UploadHouseRentAllowanceFile(houseRentAllowanceFile);
            return resp;
        }
       
        [Authorize]
        [HttpPost]
        [Route("UploadChapter6File")]
        public async Task<bool> UploadChapter6File([FromBody] Chapter6FileDetails chapter6FileDetails)
        {
            bool resp = await investmentProofsApplication.UploadChapter6File(chapter6FileDetails);
                return resp;
        }

        [Authorize]
        [HttpPost]
        [Route("UploadHouseIncomeFile")]
        public async Task<bool> UploadHouseIncomeFile([FromBody] HouseIncomeFileDetails houseIncomeFileDetails)
        {
            bool resp = await investmentProofsApplication.UploadHouseIncomeFile(houseIncomeFileDetails);
            return resp;

        }

        [Authorize]
        [HttpPost]
        [Route("UploadOtherIncomeFile")]
        public async Task<bool> UploadOtherIncomeFile([FromBody] OtherIncomeFileDetails otherIncomeFileDetails)
        {
            bool resp = await investmentProofsApplication.UploadOtherIncomeFile(otherIncomeFileDetails);
            return resp;
        }

        [Authorize]
        [HttpPost]
        [Route("UploadSection80GFile")]
        public async Task<bool> UploadSection80GFile([FromBody] Section80GFileDetails section80GFileDetails)
        {
            bool resp = await investmentProofsApplication.UploadSection80GFile(section80GFileDetails);
            return resp;
        }

        #endregion

        #region Remove investment proofs all the sections 

        [Authorize]
        [HttpGet]
        [Route("RemoveHouseRentAllowanceFile")]
        public async Task<bool> RemoveHouseRentAllowanceFile(int hraFileId)
        {
            bool resp = await investmentProofsApplication.RemoveHouseRentAllowanceFile(hraFileId);
            return resp;
        }

        [Authorize]
        [HttpGet]
        [Route("RemoveChapter6File")]
        public async Task<bool> RemoveChapter6File(int chapter6FileId)
        {
            bool resp = await investmentProofsApplication.RemoveChapter6File(chapter6FileId);
            return resp;
        }

        [Authorize]
        [HttpGet]
        [Route("RemoveHouseIncomeFile")]
        public async Task<bool> RemoveHouseIncomeFile(int houseIncomeFileId)
        {
            bool resp = await investmentProofsApplication.RemoveHouseIncomeFile(houseIncomeFileId);
            return resp;
        }

        
        [Authorize]
        [HttpGet]
        [Route("RemoveOtherIncomeFile")]
        public async  Task<bool> RemoveOtherIncomeFile(int otherIncomeFileId)
        {
            bool resp = await investmentProofsApplication.RemoveOtherIncomeFile(otherIncomeFileId);
            return resp;
        }

        #endregion
    }
}
