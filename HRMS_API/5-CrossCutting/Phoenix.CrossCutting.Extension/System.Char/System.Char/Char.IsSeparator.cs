namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the specified Unicode character is categorized as a separator character.
        /// </summary>
        /// <param name="c">The Unicode character to evaluate.</param>
        /// <returns>true if  is a separator character; otherwise, false.</returns>
        public static bool IsSeparator(this char c)
        {
            return char.IsSeparator(c);
        }
    }
}