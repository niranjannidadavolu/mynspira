using System.Text.RegularExpressions;

namespace Phoenix.CrossCutting.Extension.System.String.System.Text.RegularExpressions.Regex
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the specified regular expression finds a match in the specified input string.
        /// </summary>
        /// <param name="input">The string to search for a match.</param>
        /// <param name="pattern">The regular expression pattern to match.</param>
        /// <returns>true if the regular expression finds a match; otherwise, false.</returns>
        public static bool IsMatch(this string input, string pattern)
        {
            return global::System.Text.RegularExpressions.Regex.IsMatch(input, pattern);
        }

        /// <summary>
        ///     Indicates whether the specified regular expression finds a match in the specified input string, using the
        ///     specified matching options.
        /// </summary>
        /// <param name="input">The string to search for a match.</param>
        /// <param name="pattern">The regular expression pattern to match.</param>
        /// <param name="options">A bitwise combination of the enumeration values that provide options for matching.</param>
        /// <returns>true if the regular expression finds a match; otherwise, false.</returns>
        public static bool IsMatch(this string input, string pattern, RegexOptions options)
        {
            return global::System.Text.RegularExpressions.Regex.IsMatch(input, pattern, options);
        }
    }
}