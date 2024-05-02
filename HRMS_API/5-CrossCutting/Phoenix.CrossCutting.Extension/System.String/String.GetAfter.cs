using System;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that get the string after the specified string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="value">The value to search.</param>
        /// <returns>The string after the specified value.</returns>
        public static string GetAfter(this string @this, string value)
        {
            if (!@this.Contains(value, StringComparison.CurrentCulture))
            {
                return "";
            }

            return @this[(@this.IndexOf(value) + value.Length)..];
        }
    }
}