namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the specified Unicode character is categorized as a Unicode letter.
        /// </summary>
        /// <param name="c">The Unicode character to evaluate.</param>
        /// <returns>true if  is a letter; otherwise, false.</returns>
        public static bool IsLetter(this char c)
        {
            return char.IsLetter(c);
        }
    }
}