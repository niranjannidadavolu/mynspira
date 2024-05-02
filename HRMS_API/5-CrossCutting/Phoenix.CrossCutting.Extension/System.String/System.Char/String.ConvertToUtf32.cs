namespace Phoenix.CrossCutting.Extension.System.String.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the value of a UTF-16 encoded character or surrogate pair at a specified position in a string into a
        ///     Unicode code point.
        /// </summary>
        /// <param name="s">A string that contains a character or surrogate pair.</param>
        /// <param name="index">The index position of the character or surrogate pair in .</param>
        /// <returns>
        ///     The 21-bit Unicode code point represented by the character or surrogate pair at the position in the parameter
        ///     specified by the  parameter.
        /// </returns>
        public static int ConvertToUtf32(this string s, int index)
        {
            return char.ConvertToUtf32(s, index);
        }
    }
}