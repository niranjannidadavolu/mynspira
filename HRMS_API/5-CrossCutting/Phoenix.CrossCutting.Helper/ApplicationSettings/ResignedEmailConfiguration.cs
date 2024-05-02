using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class ResignedEmailConfiguration
    {
        public static ResignedEmailConfiguration Current;

        public ResignedEmailConfiguration()
        {
            Current = this;
        }

        public string FromEmailAddress { get; set; }
        public string ToEmailAddress { get; set; }
        public string CcEmailAddress { get; set; }
        public string MailSubject { get; set; }
        public string Emailbody { get; set; }
        public string SentTo { get; set; }

    }
}
