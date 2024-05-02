namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class ApplicationSettings
    {
        public static ApplicationSettings Current { get; set; }

        public ApplicationSettings()
        {
            Current = this;
        }

        public string ImagePath { get; set; }
        public string ProfilePath { get; set; }
        public string NoPhoto { get; set; }
        public string ReimbursementPath { get; set; }
        public int FinancialYearId { get; set; }
        public string HrmsOtpTemplate { get; set; }
        public string OTPMailTemplateId { get; set; }
        public int OtpTimeOut { get; set; }
        public string OTPMessage { get; set; }
        public string OTPMailSubject { get; set; }
        public string CarLeaseAgreementsPath { get; set; }
        public string CarLeaseMaintenancePath { get; set; }
        public string HRAInvestmentProofsPath { get; set; }
        public string Chapter6InvestmentProofsPath { get; set; }
        public string HouseIncomeInvestmentProofsfPath { get; set; }
        public string OtherIncomeInvestmentProofsPath { get; set; }
        public string PanUploadDetailsPath { get; set; }
        public string ITRUploadDetailsPath { get; set; }

        public string[] CorsUrl { get; set; }

        public int PayrollPeriodStart { get; set; }
        public int PayrollPeriodEnd { get; set; }
        public bool IntegratePolicy { get; set; }

        public string LeaveFilePath { get; set; }

        public string Environment { get; set; }
        public string VerifyProofsMessage { get; set; }
        public string VerifyProofsTemplate { get; set; }

        public string FeedbackSubject { get; set; }

        public string FeedbackEmail { get; set; }

        public string LogFilePath { get; set; }
        public string TemplateFilesPath { get; set; }
        public string DailyOutPutFilePath { get; set; }
        public bool RunJobs { get; set; }
        public int[] GetAllBranchesFor { get; set; }
        public int[] GetBranchesFor { get; set; }
        public bool AllowEmployeeVerification { get; set; }
        public string[] AllowedLegalBranches { get; set; }
        public bool AllowProofUpload { get; set; }
        public bool AllowVerfication { get; set; }

        public int[] LocalTravelDesignations { get; set; }

        public int[] ApplyLeaveVisibility { get; set; }
        public int CoolingPeriod { get; set; }
    }
}
