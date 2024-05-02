namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the value of the specified  to the equivalent single-precision floating-point number.
        /// </summary>
        /// <param name="d">The decimal number to convert.</param>
        /// <returns>A single-precision floating-point number equivalent to the value of .</returns>
        public static float ToSingle(this decimal d)
        {
            return decimal.ToSingle(d);
        }
    }
}