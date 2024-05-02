using System.Globalization;

namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Categorizes a specified Unicode character into a group identified by one of the  values.
        /// </summary>
        /// <param name="c">The Unicode character to categorize.</param>
        /// <returns>A  value that identifies the group that contains .</returns>
        public static UnicodeCategory GetUnicodeCategory(this char c)
        {
            return char.GetUnicodeCategory(c);
        }
    }
}