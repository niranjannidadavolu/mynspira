using System;

namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that query if '@this' is a weekend day.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if '@this' is a weekend day, false if not.</returns>
        public static bool IsWeekendDay(this global::System.DateTime @this)
        {
            return @this.DayOfWeek == DayOfWeek.Saturday || @this.DayOfWeek == DayOfWeek.Sunday;
        }

        public static bool IsSingleWeekEnd(this global::System.DateTime @this)
        {
            return @this.DayOfWeek == DayOfWeek.Sunday;
        }
    }
}