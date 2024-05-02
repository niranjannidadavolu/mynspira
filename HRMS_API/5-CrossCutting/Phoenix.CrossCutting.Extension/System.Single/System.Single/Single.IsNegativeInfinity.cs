namespace Phoenix.CrossCutting.Extension.System.Single.System.Single
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a value indicating whether the specified number evaluates to negative infinity.
        /// </summary>
        /// <param name="f">A single-precision floating-point number.</param>
        /// <returns>true if  evaluates to ; otherwise, false.</returns>
        public static bool IsNegativeInfinity(this float f)
        {
            return float.IsNegativeInfinity(f);
        }
    }
}