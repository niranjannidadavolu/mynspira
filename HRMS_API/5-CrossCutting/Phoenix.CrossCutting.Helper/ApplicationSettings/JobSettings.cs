using System;
using System.Linq;

namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class JobSettings
    {
        public static JobSettings Current;

        public JobSettings()
        {
            Current = this;
        }

        public bool SendEmialJob { get; set; }
        public bool AutoApprovalJob { get; set; }
        public bool ResignedEmployeeJob { get; set; }
        public bool SendOTPEmail { get; set; }
        public bool SendResignedEmployees { get; set; }
        public bool CreateAppointmentLetters { get; set; }
    }
}
