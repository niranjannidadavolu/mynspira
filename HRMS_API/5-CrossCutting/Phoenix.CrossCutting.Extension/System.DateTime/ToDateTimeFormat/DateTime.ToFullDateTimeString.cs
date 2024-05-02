using System.Globalization;

namespace Phoenix.CrossCutting.Extension.System.DateTime.ToDateTimeFormat
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that converts this object to a full date time string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The given data converted to a string.</returns>
        public static string ToFullDateTimeString(this global::System.DateTime @this)
        {
            return @this.ToString("F", DateTimeFormatInfo.CurrentInfo);
        }

        /// <summary>
        ///     A DateTime extension method that converts this object to a full date time string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="culture">The culture.</param>
        /// <returns>The given data converted to a string.</returns>
        public static string ToFullDateTimeString(this global::System.DateTime @this, string culture)
        {
            return @this.ToString("F", new CultureInfo(culture));
        }

        /// <summary>
        ///     A DateTime extension method that converts this object to a full date time string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="culture">The culture.</param>
        /// <returns>The given data converted to a string.</returns>
        public static string ToFullDateTimeString(this global::System.DateTime @this, CultureInfo culture)
        {
            return @this.ToString("F", culture);
        }

        /// <summary>
        /// To the nguide date.
        /// we are converting String into Date time CultureInfo.InvariantCulture.
        /// </summary>
        /// <param name="this">The this.</param>
        /// <returns></returns>
        public static global::System.DateTime? ToNguideDate(this string @this)
        {
            global::System.DateTime? date = null;
            if (!string.IsNullOrEmpty(@this))
            {
                date = global::System.DateTime.ParseExact(@this, @"d/M/yyyy", global::System.Globalization.CultureInfo.InvariantCulture);
            }

            return date;
        }
    }
}