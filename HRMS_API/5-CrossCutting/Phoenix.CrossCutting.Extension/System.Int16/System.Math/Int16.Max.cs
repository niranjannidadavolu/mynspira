namespace Phoenix.CrossCutting.Extension.System.Int16.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the larger of two 16-bit signed integers.
        /// </summary>
        /// <param name="val1">The first of two 16-bit signed integers to compare.</param>
        /// <param name="val2">The second of two 16-bit signed integers to compare.</param>
        /// <returns>Parameter  or , whichever is larger.</returns>
        public static short Max(this short val1, short val2)
        {
            return global::System.Math.Max(val1, val2);
        }
    }
}