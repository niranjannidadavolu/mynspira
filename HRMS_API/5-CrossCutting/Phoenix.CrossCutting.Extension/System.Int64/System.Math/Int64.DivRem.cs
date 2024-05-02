namespace Phoenix.CrossCutting.Extension.System.Int64.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An Int64 extension method that div rem.
        /// </summary>
        /// <param name="a">a to act on.</param>
        /// <param name="b">The Int64 to process.</param>
        /// <param name="result">[out] The result.</param>
        /// <returns>An Int64.</returns>
        public static long DivRem(this long a, long b, out long result)
        {
            return global::System.Math.DivRem(a, b, out result);
        }
    }
}