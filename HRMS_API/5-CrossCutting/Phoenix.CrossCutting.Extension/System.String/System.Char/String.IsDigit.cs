namespace Phoenix.CrossCutting.Extension.System.String.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the character at the specified position in a specified string is categorized as a decimal
        ///     digit.
        /// </summary>
        /// <param name="s">A string.</param>
        /// <param name="index">The position of the character to evaluate in .</param>
        /// <returns>true if the character at position  in  is a decimal digit; otherwise, false.</returns>
        public static bool IsDigit(this string s, int index)
        {
            return char.IsDigit(s, index);
        }
    }
}