namespace Phoenix.CrossCutting.Extension.System.SByte.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the absolute value of an 8-bit signed integer.
        /// </summary>
        /// <param name="value">A number that is greater than , but less than or equal to .</param>
        /// <returns>An 8-bit signed integer, x, such that 0 ? x ?.</returns>
        public static sbyte Abs(this sbyte value)
        {
            return global::System.Math.Abs(value);
        }
    }
}