using System;
using System.Collections.Generic;

namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        public static IEnumerable<global::System.DateTime> GetDateRange(this global::System.DateTime @startDate, global::System.DateTime endDate)
        {
            if (endDate < @startDate)
                throw new ArgumentException("endDate must be greater than or equal to startDate");

            while (@startDate <= endDate)
            {
                yield return startDate;
                startDate = startDate.AddDays(1);
            }
        }
    }
}
