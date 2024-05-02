using Phoenix.Application.InvestmentProofs.Interfaces;
using Phoenix.Domain.Investment.Interfaces;
using Phoenix.Model.Business.InvestmentProofs;
using System.Collections.Generic;
using System.Threading.Tasks;
using Phoenix.Domain.InvestmentProofs.Interfaces;
using Newtonsoft.Json;
using RestSharp;
using System.Net;
using System;
using Phoenix.Model.Business.InvestmentProofs.Pan;
using Phoenix.Model.Business.EmployeeVerification;
using static System.Net.Mime.MediaTypeNames;
using System.Text;

namespace Phoenix.Application.InvestmentProofs.Implementations
{
    public class InvestmentProofsApplication : IInvestmentProofsApplication
    {
        private readonly IInvestmentProofsDomain investmentProofsDomain;
        public InvestmentProofsApplication(IInvestmentProofsDomain investmentProofsDomain)
        {
            this.investmentProofsDomain = investmentProofsDomain;
        }

        #region Get investment proofs all sections files
        public async Task<List<HouseRentAllowanceFile>> GetHouseRentAllowancFiles(int rentPaymentId)
        {
            List<HouseRentAllowanceFile> houseRentAllowanceFiles = await investmentProofsDomain.GetHouseRentAllowancFiles(rentPaymentId);
            return houseRentAllowanceFiles;
        }
        public async Task<List<Chapter6FileDetails>> GetChapter6Files(int chapter6DetailId)
        {
            List<Chapter6FileDetails> chapter6FileDetails = await investmentProofsDomain.GetChapter6Files(chapter6DetailId);
            return chapter6FileDetails;
        }

        public async Task<List<HouseIncomeFileDetails>> GetHouseIncomeFiles(int houseIncomeDetailId)
        {
            List<HouseIncomeFileDetails> houseIncomeFileDetails = await investmentProofsDomain.GetHouseIncomeFiles(houseIncomeDetailId);
            return houseIncomeFileDetails;
        }

        public async Task<List<OtherIncomeFileDetails>> GetOtherIncomeFiles(int otherIncomeDetailId)
        {
            List<OtherIncomeFileDetails> otherIncomeFileDetails = await investmentProofsDomain.GetOtherIncomeFiles(otherIncomeDetailId);
            return otherIncomeFileDetails;
        }
        public async Task<List<Section80GFileDetails>> GetSection80GFiles(int tDS80GSLNO)
        {
            List<Section80GFileDetails> otherIncomeFileDetails = await investmentProofsDomain.GetSection80GFiles(tDS80GSLNO);
            return otherIncomeFileDetails;
        }

        public async Task<VerifiedPanInformation> VerifyPanNumber(int hraId, string panNumber)
        {
            VerifiedPanInformation verifiedPanInformation = null;
            string sendBoxToken = GetSendBoxToken();
            PanVerificationResult panData = GetPanCardDetails(sendBoxToken, panNumber);
            if (panData != null)
            {
                verifiedPanInformation = new VerifiedPanInformation
                {
                    Pan = panData.PanData.Pan,
                    FirstName = panData.PanData.FirstName,
                    MiddleName = panData.PanData.MiddleName,
                    LastName = panData.PanData.LastName,
                    FullName = panData.PanData.FullName,
                    AadhaarSeedingStatus = panData.PanData.AadhaarSeedingStatus,
                    Category = panData.PanData.Category,
                    LastUpdated = panData.PanData.LastUpdated,
                    TimeStamp = panData.TimeStamp,
                    TransactionId = panData.TransactionId,
                    Code = panData.Code,
                    HraId = hraId
                };
            }
            return verifiedPanInformation;
        }

        #endregion

        #region PanVerification
        private PanVerificationResult GetPanCardDetails(string token, string panNumber)
        {
            string body = string.Empty;
            PanVerificationResult panDetails = null;
            PanVerify verificationRequest = new PanVerify();
            verificationRequest.Consent = "Y";
            verificationRequest.Pan = panNumber;
            verificationRequest.Reason = "Investment Details Verification";
            var options = new RestClientOptions("https://api.sandbox.co.in/kyc/pan");
            var client = new RestClient(options);
            var request = new RestRequest("");
            request.AddHeader("accept", "application/json");
            request.AddHeader("x-api-key", "key_live_71IVNcYzDGCaxxqYzwosLoCotgzjja6G");
            request.AddHeader("x-api-version", "1.0");
            request.AddHeader("Authorization", token);
            body = JsonConvert.SerializeObject(verificationRequest);
            request.AddStringBody(body, DataFormat.Json);
            RestResponse response = client.PostAsync(request).Result;

            if (response.Content != null)
            {
                panDetails = JsonConvert.DeserializeObject<PanVerificationResult>(response.Content);
            }

            return panDetails;
        }

        public string GetSendBoxToken()
        {
            string rtntoken = string.Empty;
            var client = new RestClient("https://api.sandbox.co.in");
            var request = new RestRequest("/authenticate", RestSharp.Method.Post);
            request.AddHeader("x-api-key", "key_live_71IVNcYzDGCaxxqYzwosLoCotgzjja6G");
            request.AddHeader("x-api-secret", "secret_live_xKhvGCQ4diIn0wfy6xtxAbO14dAuN9Rm");
            request.AddHeader("x-api-version", "1.0");
            request.AddHeader("accept", "application/json");
            //ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            RestResponse<AccessToken> response = client.ExecuteAsync<AccessToken>(request).Result;
            if (response.Data != null)
            {
                AccessToken token = JsonConvert.DeserializeObject<AccessToken>(response.Content);
                rtntoken = token.AccessTokenValue;
            }
            return rtntoken;
        }

        #endregion
        #region  Upload file for all sections
        public async Task<bool> UploadHouseRentAllowanceFile(HouseRentAllowanceFile houseRentAllowanceFile)
        {
            bool resp = await investmentProofsDomain.UploadHouseRentAllowanceFile(houseRentAllowanceFile);
            return resp;
        }
        public async Task<bool> UploadChapter6File(Chapter6FileDetails chapter6FileDetails)
        {
            bool resp = await investmentProofsDomain.UploadChapter6File(chapter6FileDetails);
            return resp;
        }
        public async Task<bool> UploadHouseIncomeFile(HouseIncomeFileDetails houseIncomeFileDetails)
        {
            bool resp = await investmentProofsDomain.UploadHouseIncomeFile(houseIncomeFileDetails);
            return resp;

        }
        public async Task<bool> UploadOtherIncomeFile(OtherIncomeFileDetails otherIncomeFileDetails)
        {
            bool resp = await investmentProofsDomain.UploadOtherIncomeFile(otherIncomeFileDetails);
            return resp;
        }
        public async Task<bool> UploadSection80GFile(Section80GFileDetails section80GFileDetails)
        {
            bool resp = await investmentProofsDomain.UploadSection80GFile(section80GFileDetails);
            return resp;
        }
        #endregion

        #region Remove investment proofs files all sections 

        public async Task<bool> RemoveHouseRentAllowanceFile(int hraFileId)
        {
            bool resp = await investmentProofsDomain.RemoveHouseRentAllowanceFile(hraFileId);
            return resp;
        }
        public async Task<bool> RemoveChapter6File(int chapter6FileId)
        {
            bool resp = await investmentProofsDomain.RemoveChapter6File(chapter6FileId);
            return resp;
        }

        public async Task<bool> RemoveHouseIncomeFile(int houseIncomeFileId)
        {
            bool resp = await investmentProofsDomain.RemoveHouseIncomeFile(houseIncomeFileId);
            return resp;
        }

        public async Task<bool> RemoveOtherIncomeFile(int otherIncomeFileId)
        {
            bool resp = await investmentProofsDomain.RemoveOtherIncomeFile(otherIncomeFileId);
            return resp;
        }



        #endregion
    }
}
