namespace Phoenix.CrossCutting.Extension.System.Double.System.Double
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a value that indicates whether the specified value is not a number ().
        /// </summary>
        /// <param name="d">A double-precision floating-point number.</param>
        /// <returns>true if  evaluates to ; otherwise, false.</returns>
        public static bool IsNaN(this double d)
        {
            return double.IsNaN(d);
        }
    }
}