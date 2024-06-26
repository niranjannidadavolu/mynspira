namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the larger of two double-precision floating-point numbers.
        /// </summary>
        /// <param name="val1">The first of two double-precision floating-point numbers to compare.</param>
        /// <param name="val2">The second of two double-precision floating-point numbers to compare.</param>
        /// <returns>Parameter  or , whichever is larger. If , , or both  and  are equal to ,  is returned.</returns>
        public static double Max(this double val1, double val2)
        {
            return global::System.Math.Max(val1, val2);
        }
    }
}