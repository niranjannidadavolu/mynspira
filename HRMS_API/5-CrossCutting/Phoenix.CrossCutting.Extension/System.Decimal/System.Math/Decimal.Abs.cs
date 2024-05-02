namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the absolute value of a  number.
        /// </summary>
        /// <param name="value">A number that is greater than or equal to , but less than or equal to .</param>
        /// <returns>A decimal number, x, such that 0 ? x ?.</returns>
        public static decimal Abs(this decimal value)
        {
            return global::System.Math.Abs(value);
        }
    }
}