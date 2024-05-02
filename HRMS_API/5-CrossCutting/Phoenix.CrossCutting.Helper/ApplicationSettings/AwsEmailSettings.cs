using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class AwsEmailSettings
    {
        public static AwsEmailSettings Current;

        public AwsEmailSettings()
        {
            Current = this;
        }

        public string FromEmail { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int Port { get; set; }
        public string Host { get; set; }
    }
}
