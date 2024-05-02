namespace Phoenix.CrossCutting.Extension.System.Int32.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Produces the full product of two 32-bit numbers.
        /// </summary>
        /// <param name="a">The first number to multiply.</param>
        /// <param name="b">The second number to multiply.</param>
        /// <returns>The number containing the product of the specified numbers.</returns>
        public static long BigMul(this int a, int b)
        {
            return global::System.Math.BigMul(a, b);
        }
    }
}