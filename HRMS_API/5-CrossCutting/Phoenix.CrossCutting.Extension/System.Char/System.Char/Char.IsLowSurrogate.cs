namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the specified  object is a low surrogate.
        /// </summary>
        /// <param name="c">The character to evaluate.</param>
        /// <returns>
        ///     true if the numeric value of the  parameter ranges from U+DC00 through U+DFFF; otherwise, false.
        /// </returns>
        public static bool IsLowSurrogate(this char c)
        {
            return char.IsLowSurrogate(c);
        }
    }
}