namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the value of the specified  to the equivalent 64-bit signed integer.
        /// </summary>
        /// <param name="d">The decimal number to convert.</param>
        /// <returns>A 64-bit signed integer equivalent to the value of .</returns>
        public static long ToInt64(this decimal d)
        {
            return decimal.ToInt64(d);
        }
    }
}