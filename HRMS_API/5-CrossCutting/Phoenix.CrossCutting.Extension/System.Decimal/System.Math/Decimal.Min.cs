namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the smaller of two decimal numbers.
        /// </summary>
        /// <param name="val1">The first of two decimal numbers to compare.</param>
        /// <param name="val2">The second of two decimal numbers to compare.</param>
        /// <returns>Parameter  or , whichever is smaller.</returns>
        public static decimal Min(this decimal val1, decimal val2)
        {
            return global::System.Math.Min(val1, val2);
        }
    }
}