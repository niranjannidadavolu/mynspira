namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the value of the specified  to the equivalent 32-bit unsigned integer.
        /// </summary>
        /// <param name="d">The decimal number to convert.</param>
        /// <returns>A 32-bit unsigned integer equivalent to the value of .</returns>
        public static uint ToUInt32(this decimal d)
        {
            return decimal.ToUInt32(d);
        }
    }
}