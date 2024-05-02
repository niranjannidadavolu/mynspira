namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the specified Unicode character is categorized as a decimal digit.
        /// </summary>
        /// <param name="c">The Unicode character to evaluate.</param>
        /// <returns>true if  is a decimal digit; otherwise, false.</returns>
        public static bool IsDigit(this char c)
        {
            return char.IsDigit(c);
        }
    }
}