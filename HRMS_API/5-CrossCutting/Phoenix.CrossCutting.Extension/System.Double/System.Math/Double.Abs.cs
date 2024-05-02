namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the absolute value of a double-precision floating-point number.
        /// </summary>
        /// <param name="value">A number that is greater than or equal to , but less than or equal to .</param>
        /// <returns>A double-precision floating-point number, x, such that 0 ? x ?.</returns>
        public static double Abs(this double value)
        {
            return global::System.Math.Abs(value);
        }
    }
}