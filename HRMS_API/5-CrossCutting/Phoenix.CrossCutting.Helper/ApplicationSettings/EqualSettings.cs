using System;
using System.Linq;

namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class EqualSettings
    {
        public static EqualSettings Current;

        public EqualSettings()
        {
            Current = this;
        }

        public string ClientId { get; set; }
        public string ClientSecret { get; set; }
        public string GateWayInstance { get; set; }
        public string EqualGateWayUrl { get; set; }
        public string ExperiencedPerson { get; set; }
        public string Fresher { get; set; }
        public string Driver { get; set; }


        public string InitializeTransaction { get; set; }
        public string FetchData { get; set; }

        public string EqualInitGateWayUrl { get; set; }


    }
}
