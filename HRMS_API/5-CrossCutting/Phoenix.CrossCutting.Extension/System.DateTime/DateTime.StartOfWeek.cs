using System;

namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that starts of week.
        /// </summary>
        /// <param name="dt">The dt to act on.</param>
        /// <param name="startDayOfWeek">(Optional) the start day of week.</param>
        /// <returns>A DateTime.</returns>
        public static global::System.DateTime StartOfWeek(this global::System.DateTime dt, DayOfWeek startDayOfWeek = DayOfWeek.Sunday)
        {
            global::System.DateTime start = new(dt.Year, dt.Month, dt.Day);

            if (start.DayOfWeek != startDayOfWeek)
            {
                int d = startDayOfWeek - start.DayOfWeek;
                if (startDayOfWeek <= start.DayOfWeek)
                {
                    return start.AddDays(d);
                }

                return start.AddDays(-7 + d);
            }

            return start;
        }
    }
}