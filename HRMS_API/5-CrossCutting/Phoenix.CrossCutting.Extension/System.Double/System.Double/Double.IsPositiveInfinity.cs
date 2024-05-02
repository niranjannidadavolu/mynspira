namespace Phoenix.CrossCutting.Extension.System.Double.System.Double
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a value indicating whether the specified number evaluates to positive infinity.
        /// </summary>
        /// <param name="d">A double-precision floating-point number.</param>
        /// <returns>true if  evaluates to ; otherwise, false.</returns>
        public static bool IsPositiveInfinity(this double d)
        {
            return double.IsPositiveInfinity(d);
        }
    }
}