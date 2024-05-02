namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Divides two specified  values.
        /// </summary>
        /// <param name="d1">The dividend.</param>
        /// <param name="d2">The divisor.</param>
        /// <returns>The result of dividing  by .</returns>
        public static decimal Divide(this decimal d1, decimal d2)
        {
            return decimal.Divide(d1, d2);
        }
    }
}