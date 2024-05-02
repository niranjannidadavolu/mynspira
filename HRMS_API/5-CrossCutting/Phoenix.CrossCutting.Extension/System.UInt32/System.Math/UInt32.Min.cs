namespace Phoenix.CrossCutting.Extension.System.UInt32.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the smaller of two 32-bit unsigned integers.
        /// </summary>
        /// <param name="val1">The first of two 32-bit unsigned integers to compare.</param>
        /// <param name="val2">The second of two 32-bit unsigned integers to compare.</param>
        /// <returns>Parameter  or , whichever is smaller.</returns>
        public static uint Min(this uint val1, uint val2)
        {
            return global::System.Math.Min(val1, val2);
        }
    }
}