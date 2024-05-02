namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the result of multiplying the specified  value by negative one.
        /// </summary>
        /// <param name="d">The value to negate.</param>
        /// <returns>A decimal number with the value of , but the opposite sign.-or- Zero, if  is zero.</returns>
        public static decimal Negate(this decimal d)
        {
            return decimal.Negate(d);
        }
    }
}