namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Subtracts one specified  value from another.
        /// </summary>
        /// <param name="d1">The minuend.</param>
        /// <param name="d2">The subtrahend.</param>
        /// <returns>The result of subtracting  from .</returns>
        public static decimal Subtract(this decimal d1, decimal d2)
        {
            return decimal.Subtract(d1, d2);
        }
    }
}