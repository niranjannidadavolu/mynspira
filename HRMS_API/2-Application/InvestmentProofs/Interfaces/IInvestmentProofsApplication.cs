﻿using Phoenix.Model.Business.InvestmentProofs;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace Phoenix.Application.InvestmentProofs.Interfaces
{
    public interface IInvestmentProofsApplication
    {

        #region Get investment proofs all sections files
        Task<List<HouseRentAllowanceFile>> GetHouseRentAllowancFiles(int rentPaymentId);
        Task<List<Chapter6FileDetails>> GetChapter6Files(int chapter6DetailId);
        Task<List<HouseIncomeFileDetails>> GetHouseIncomeFiles(int houseIncomeDetailId);
        Task<List<OtherIncomeFileDetails>> GetOtherIncomeFiles(int otherIncomeDetailId);
        #endregion

        #region  Upload file for all sections
        Task<bool> UploadHouseRentAllowanceFile(HouseRentAllowanceFile houseRentAllowanceFile);
        Task<bool> UploadChapter6File(Chapter6FileDetails chapter6FileDetails);
        Task<bool> UploadHouseIncomeFile(HouseIncomeFileDetails houseIncomeFileDetails);
        Task<bool> UploadOtherIncomeFile(OtherIncomeFileDetails otherIncomeFileDetails);
        #endregion 

        #region Remove investment proofs files all sections 
        Task<bool> RemoveHouseRentAllowanceFile(int hraFileId);
        Task<bool> RemoveChapter6File(int chapter6FileId);
        Task<bool> RemoveHouseIncomeFile(int houseIncomeFileId);
        Task<bool> RemoveOtherIncomeFile(int otherIncomeFileId);
        Task<bool> UploadSection80GFile(Section80GFileDetails section80GFileDetails);
        Task<List<Section80GFileDetails>> GetSection80GFiles(int tDS80GSLNO);
        #endregion

        Task<VerifiedPanInformation> VerifyPanNumber(int hraId, string panNumber);
    }
}