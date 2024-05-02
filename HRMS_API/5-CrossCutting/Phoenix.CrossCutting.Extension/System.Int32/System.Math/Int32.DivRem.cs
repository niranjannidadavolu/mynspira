namespace Phoenix.CrossCutting.Extension.System.Int32.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An Int32 extension method that div rem.
        /// </summary>
        /// <param name="a">a to act on.</param>
        /// <param name="b">The Int32 to process.</param>
        /// <param name="result">[out] The result.</param>
        /// <returns>An Int32.</returns>
        public static int DivRem(this int a, int b, out int result)
        {
            return global::System.Math.DivRem(a, b, out result);
        }
    }
}