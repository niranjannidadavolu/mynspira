using System.Text.RegularExpressions;

namespace Phoenix.CrossCutting.Extension.System.String.System.Text.RegularExpressions.Regex
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Searches the specified input string for all occurrences of a specified regular expression.
        /// </summary>
        /// <param name="input">The string to search for a match.</param>
        /// <param name="pattern">The regular expression pattern to match.</param>
        /// <returns>
        ///     A collection of the  objects found by the search. If no matches are found, the method returns an empty
        ///     collection object.
        /// </returns>
        public static MatchCollection Matches(this string input, string pattern)
        {
            return global::System.Text.RegularExpressions.Regex.Matches(input, pattern);
        }

        /// <summary>
        ///     Searches the specified input string for all occurrences of a specified regular expression, using the
        ///     specified matching options.
        /// </summary>
        /// <param name="input">The string to search for a match.</param>
        /// <param name="pattern">The regular expression pattern to match.</param>
        /// <param name="options">A bitwise combination of the enumeration values that specify options for matching.</param>
        /// <returns>
        ///     A collection of the  objects found by the search. If no matches are found, the method returns an empty
        ///     collection object.
        /// </returns>
        public static MatchCollection Matches(this string input, string pattern, RegexOptions options)
        {
            return global::System.Text.RegularExpressions.Regex.Matches(input, pattern, options);
        }
    }
}