using System.Globalization;

namespace Phoenix.CrossCutting.Extension.System.DateTime.System.TimeZone
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a value indicating whether the specified date and time is within the specified daylight saving time
        ///     period.
        /// </summary>
        /// <param name="time">A date and time.</param>
        /// <param name="daylightTimes">A daylight saving time period.</param>
        /// <returns>true if  is in ; otherwise, false.</returns>
        public static bool IsDaylightSavingTime(this global::System.DateTime time, DaylightTime daylightTimes)
        {
            return global::System.TimeZone.IsDaylightSavingTime(time, daylightTimes);
        }
    }
}