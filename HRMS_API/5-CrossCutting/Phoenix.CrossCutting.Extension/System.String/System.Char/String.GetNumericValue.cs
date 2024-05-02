namespace Phoenix.CrossCutting.Extension.System.String.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the numeric Unicode character at the specified position in a specified string to a double-precision
        ///     floating point number.
        /// </summary>
        /// <param name="s">A .</param>
        /// <param name="index">The character position in .</param>
        /// <returns>
        ///     The numeric value of the character at position  in  if that character represents a number; otherwise, -1.
        /// </returns>
        public static double GetNumericValue(this string s, int index)
        {
            return char.GetNumericValue(s, index);
        }
    }
}