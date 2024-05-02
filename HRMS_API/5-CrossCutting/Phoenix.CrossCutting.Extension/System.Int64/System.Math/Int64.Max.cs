namespace Phoenix.CrossCutting.Extension.System.Int64.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the larger of two 64-bit signed integers.
        /// </summary>
        /// <param name="val1">The first of two 64-bit signed integers to compare.</param>
        /// <param name="val2">The second of two 64-bit signed integers to compare.</param>
        /// <returns>Parameter  or , whichever is larger.</returns>
        public static long Max(this long val1, long val2)
        {
            return global::System.Math.Max(val1, val2);
        }
    }
}