namespace Phoenix.CrossCutting.Extension.System.String.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the  object at the specified position in a string is a high surrogate.
        /// </summary>
        /// <param name="s">A string.</param>
        /// <param name="index">The position of the character to evaluate in .</param>
        /// <returns>
        ///     true if the numeric value of the specified character in the  parameter ranges from U+D800 through U+DBFF;
        ///     otherwise, false.
        /// </returns>
        public static bool IsHighSurrogate(this string s, int index)
        {
            return char.IsHighSurrogate(s, index);
        }
    }
}