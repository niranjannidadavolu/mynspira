namespace Phoenix.CrossCutting.Extension.System.Char.System.Char
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the specified Unicode character to its equivalent string representation.
        /// </summary>
        /// <param name="c">The Unicode character to convert.</param>
        /// <returns>The string representation of the value of .</returns>
        public static string ToString(this char c)
        {
            return char.ToString(c);
        }
    }
}