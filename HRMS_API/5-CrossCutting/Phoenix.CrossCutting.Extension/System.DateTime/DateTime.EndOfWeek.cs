using System;

namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A System.DateTime extension method that ends of week.
        /// </summary>
        /// <param name="dt">Date/Time of the dt.</param>
        /// <param name="startDayOfWeek">(Optional) the start day of week.</param>
        /// <returns>A DateTime.</returns>
        public static global::System.DateTime EndOfWeek(this global::System.DateTime dt, DayOfWeek startDayOfWeek = DayOfWeek.Sunday)
        {
            global::System.DateTime end = dt;
            DayOfWeek endDayOfWeek = startDayOfWeek - 1;
            if (endDayOfWeek < 0)
            {
                endDayOfWeek = DayOfWeek.Saturday;
            }

            if (end.DayOfWeek != endDayOfWeek)
            {
                if (endDayOfWeek < end.DayOfWeek)
                {
                    end = end.AddDays(7 - (end.DayOfWeek - endDayOfWeek));
                }
                else
                {
                    end = end.AddDays(endDayOfWeek - end.DayOfWeek);
                }
            }

            return new global::System.DateTime(end.Year, end.Month, end.Day, 23, 59, 59, 999);
        }
    }
}