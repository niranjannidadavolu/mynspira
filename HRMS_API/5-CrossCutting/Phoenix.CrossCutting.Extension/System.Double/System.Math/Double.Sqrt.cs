namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the square root of a specified number.
        /// </summary>
        /// <param name="d">The number whose square root is to be found.</param>
        /// <returns>
        ///     One of the values in the following table.  parameter Return value Zero or positive The positive square root
        ///     of . Negative Equals Equals.
        /// </returns>
        public static double Sqrt(this double d)
        {
            return global::System.Math.Sqrt(d);
        }
    }
}