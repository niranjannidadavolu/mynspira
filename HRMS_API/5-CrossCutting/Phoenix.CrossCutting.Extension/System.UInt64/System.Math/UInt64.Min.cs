namespace Phoenix.CrossCutting.Extension.System.UInt64.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the smaller of two 64-bit unsigned integers.
        /// </summary>
        /// <param name="val1">The first of two 64-bit unsigned integers to compare.</param>
        /// <param name="val2">The second of two 64-bit unsigned integers to compare.</param>
        /// <returns>Parameter  or , whichever is smaller.</returns>
        public static ulong Min(this ulong val1, ulong val2)
        {
            return global::System.Math.Min(val1, val2);
        }
    }
}