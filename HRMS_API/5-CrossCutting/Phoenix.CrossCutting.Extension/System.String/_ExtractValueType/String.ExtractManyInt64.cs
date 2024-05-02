using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace Phoenix.CrossCutting.Extension.System.String._ExtractValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that extracts all Int64 from the string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>All extracted Int64.</returns>
        public static long[] ExtractManyInt64(this string @this)
        {
            return Regex.Matches(@this, @"[-]?\d+")
                .Cast<Match>()
                .Select(x => Convert.ToInt64(x.Value))
                .ToArray();
        }
    }
}