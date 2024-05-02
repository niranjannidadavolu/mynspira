namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Computes the remainder after dividing two  values.
        /// </summary>
        /// <param name="d1">The dividend.</param>
        /// <param name="d2">The divisor.</param>
        /// <returns>The remainder after dividing  by .</returns>
        public static decimal Remainder(this decimal d1, decimal d2)
        {
            return decimal.Remainder(d1, d2);
        }
    }
}