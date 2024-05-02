namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Indicates whether the specified Unicode character is categorized as a number.
        /// </summary>
        /// <param name="c">The Unicode character to evaluate.</param>
        /// <returns>true if  is a number; otherwise, false.</returns>
        public static bool IsNumber(this char c)
        {
            return char.IsNumber(c);
        }
    }
}