namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the value of the specified  to the equivalent 8-bit unsigned integer.
        /// </summary>
        /// <param name="value">The decimal number to convert.</param>
        /// <returns>An 8-bit unsigned integer equivalent to .</returns>
        public static byte ToByte(this decimal value)
        {
            return decimal.ToByte(value);
        }
    }
}