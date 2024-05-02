namespace Phoenix.CrossCutting.Extension.System.Int32.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the absolute value of a 32-bit signed integer.
        /// </summary>
        /// <param name="value">A number that is greater than , but less than or equal to .</param>
        /// <returns>A 32-bit signed integer, x, such that 0 ? x ?.</returns>
        public static int Abs(this int value)
        {
            return global::System.Math.Abs(value);
        }
    }
}