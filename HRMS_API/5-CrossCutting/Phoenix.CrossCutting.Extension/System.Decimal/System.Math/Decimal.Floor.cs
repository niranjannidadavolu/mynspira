namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the largest integer less than or equal to the specified decimal number.
        /// </summary>
        /// <param name="d">A decimal number.</param>
        /// <returns>
        ///     The largest integer less than or equal to .  Note that the method returns an integral value of type .
        /// </returns>
        public static decimal Floor(this decimal d)
        {
            return global::System.Math.Floor(d);
        }
    }
}