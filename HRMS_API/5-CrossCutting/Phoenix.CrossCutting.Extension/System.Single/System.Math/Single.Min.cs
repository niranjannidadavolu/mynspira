namespace Phoenix.CrossCutting.Extension.System.Single.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the smaller of two single-precision floating-point numbers.
        /// </summary>
        /// <param name="val1">The first of two single-precision floating-point numbers to compare.</param>
        /// <param name="val2">The second of two single-precision floating-point numbers to compare.</param>
        /// <returns>Parameter  or , whichever is smaller. If , , or both  and  are equal to ,  is returned.</returns>
        public static float Min(this float val1, float val2)
        {
            return global::System.Math.Min(val1, val2);
        }
    }
}