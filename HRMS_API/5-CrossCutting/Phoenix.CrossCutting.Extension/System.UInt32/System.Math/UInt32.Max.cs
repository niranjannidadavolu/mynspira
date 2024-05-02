namespace Phoenix.CrossCutting.Extension.System.UInt32.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the larger of two 32-bit unsigned integers.
        /// </summary>
        /// <param name="val1">The first of two 32-bit unsigned integers to compare.</param>
        /// <param name="val2">The second of two 32-bit unsigned integers to compare.</param>
        /// <returns>Parameter  or , whichever is larger.</returns>
        public static uint Max(this uint val1, uint val2)
        {
            return global::System.Math.Max(val1, val2);
        }
    }
}