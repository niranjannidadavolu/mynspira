namespace Phoenix.CrossCutting.Extension.System.Int32.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the smaller of two 32-bit signed integers.
        /// </summary>
        /// <param name="val1">The first of two 32-bit signed integers to compare.</param>
        /// <param name="val2">The second of two 32-bit signed integers to compare.</param>
        /// <returns>Parameter  or , whichever is smaller.</returns>
        public static int Min(this int val1, int val2)
        {
            return global::System.Math.Min(val1, val2);
        }
    }
}