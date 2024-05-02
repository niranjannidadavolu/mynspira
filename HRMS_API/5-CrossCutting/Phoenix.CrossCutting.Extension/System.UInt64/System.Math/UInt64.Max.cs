namespace Phoenix.CrossCutting.Extension.System.UInt64.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the larger of two 64-bit unsigned integers.
        /// </summary>
        /// <param name="val1">The first of two 64-bit unsigned integers to compare.</param>
        /// <param name="val2">The second of two 64-bit unsigned integers to compare.</param>
        /// <returns>Parameter  or , whichever is larger.</returns>
        public static ulong Max(this ulong val1, ulong val2)
        {
            return global::System.Math.Max(val1, val2);
        }
    }
}