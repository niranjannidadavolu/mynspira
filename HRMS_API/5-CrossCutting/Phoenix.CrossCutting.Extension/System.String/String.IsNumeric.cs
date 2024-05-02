using System.Text.RegularExpressions;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that query if '@this' is numeric.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if numeric, false if not.</returns>
        public static bool IsNumeric(this string @this)
        {
            return !Regex.IsMatch(@this, "[^0-9]");
        }
    }
}