namespace Phoenix.CrossCutting.Extension.System.Double.System.Double
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a value indicating whether the specified number evaluates to negative or positive infinity.
        /// </summary>
        /// <param name="d">A double-precision floating-point number.</param>
        /// <returns>true if  evaluates to  or ; otherwise, false.</returns>
        public static bool IsInfinity(this double d)
        {
            return double.IsInfinity(d);
        }
    }
}