using System.Text;

namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        public static string ToFinancialYear(this global::System.DateTime dateTime)
        {
            return "Financial Year " + (dateTime.Month >= 4 ? dateTime.Year + 1 : dateTime.Year);
        }

        public static string ToFinancialYearShort(this global::System.DateTime dateTime)
        {
            return "FY" + (dateTime.Month >= 4 ? dateTime.AddYears(1).ToString("yy") : dateTime.ToString("yy"));
        }

        public static string ToFinancialYearLong(this global::System.DateTime dateTime)
        {
            int finacialStartYear;
            int finacialEndYear;
            finacialStartYear = dateTime.Month < 4 ? dateTime.Year - 1 : dateTime.Year;
            finacialEndYear = dateTime.Month >= 4 ? dateTime.AddYears(1).Year : dateTime.Year;
            StringBuilder sbFinancialYear = new();
            sbFinancialYear.AppendFormat("{0}-{1}", finacialStartYear.ToString("D4"), finacialEndYear.ToString("D4"));
            return sbFinancialYear.ToString();
        }
    }
}
