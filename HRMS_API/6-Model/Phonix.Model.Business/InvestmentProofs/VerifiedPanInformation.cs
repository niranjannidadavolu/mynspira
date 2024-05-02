using Newtonsoft.Json;
using Phoenix.Model.Business.FileUpload;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.InvestmentProofs
{
    public class VerifiedPanInformation
    {
        public int HraId { get; set; }

        public string Code;
        public string TimeStamp;
        public string TransactionId;
        public string Pan { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string AadhaarSeedingStatus { get; set; }
        public string Category { get; set; }
        public string LastUpdated { get; set; }
    }
}
