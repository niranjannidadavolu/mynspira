namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the value of a Unicode character to its uppercase equivalent using the casing rules of the invariant
        ///     culture.
        /// </summary>
        /// <param name="c">The Unicode character to convert.</param>
        /// <returns>
        ///     The uppercase equivalent of the  parameter, or the unchanged value of , if  is already uppercase or not
        ///     alphabetic.
        /// </returns>
        public static char ToUpperInvariant(this char c)
        {
            return char.ToUpperInvariant(c);
        }
    }
}