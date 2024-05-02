using Phoenix.Model.Business.FileUpload;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.InvestmentProofs
{
    public class Section80GFileDetails
    {
        public int TDS80GFILESLNO { get; set; }
        public int TDS80GSLNO { get; set; }
        public string FileName { get; set; }
        public string FileName_Original { get; set; }
        public string FilePath { get; set; }
        public bool Status { get; set; }
        public FileToUpload FileToUpload { get; set; }
    }
}
