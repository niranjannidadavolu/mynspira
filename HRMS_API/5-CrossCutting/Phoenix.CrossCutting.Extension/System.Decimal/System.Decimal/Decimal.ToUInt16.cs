namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the value of the specified  to the equivalent 16-bit unsigned integer.
        /// </summary>
        /// <param name="value">The decimal number to convert.</param>
        /// <returns>A 16-bit unsigned integer equivalent to the value of .</returns>
        public static ushort ToUInt16(this decimal value)
        {
            return decimal.ToUInt16(value);
        }
    }
}