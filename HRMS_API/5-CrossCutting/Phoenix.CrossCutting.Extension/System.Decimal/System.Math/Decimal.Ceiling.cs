namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the smallest integral value that is greater than or equal to the specified decimal number.
        /// </summary>
        /// <param name="d">A decimal number.</param>
        /// <returns>
        ///     The smallest integral value that is greater than or equal to . Note that this method returns a  instead of an
        ///     integral type.
        /// </returns>
        public static decimal Ceiling(this decimal d)
        {
            return global::System.Math.Ceiling(d);
        }
    }
}