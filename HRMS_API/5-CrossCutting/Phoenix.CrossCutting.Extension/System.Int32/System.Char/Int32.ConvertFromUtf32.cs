namespace Phoenix.CrossCutting.Extension.System.Int32.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the specified Unicode code point into a UTF-16 encoded string.
        /// </summary>
        /// <param name="utf32">A 21-bit Unicode code point.</param>
        /// <returns>
        ///     A string consisting of one  object or a surrogate pair of  objects equivalent to the code point specified by
        ///     the  parameter.
        /// </returns>
        public static string ConvertFromUtf32(this int utf32)
        {
            return char.ConvertFromUtf32(utf32);
        }
    }
}