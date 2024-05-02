namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the specified Unicode character is categorized as a punctuation mark.
        /// </summary>
        /// <param name="c">The Unicode character to evaluate.</param>
        /// <returns>true if  is a punctuation mark; otherwise, false.</returns>
        public static bool IsPunctuation(this char c)
        {
            return char.IsPunctuation(c);
        }
    }
}