namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Multiplies two specified  values.
        /// </summary>
        /// <param name="d1">The multiplicand.</param>
        /// <param name="d2">The multiplier.</param>
        /// <returns>The result of multiplying  and .</returns>
        public static decimal Multiply(this decimal d1, decimal d2)
        {
            return decimal.Multiply(d1, d2);
        }
    }
}