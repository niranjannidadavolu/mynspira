namespace Phoenix.CrossCutting.Extension.System.Int16.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the absolute value of a 16-bit signed integer.
        /// </summary>
        /// <param name="value">A number that is greater than , but less than or equal to .</param>
        /// <returns>A 16-bit signed integer, x, such that 0 ? x ?.</returns>
        public static short Abs(this short value)
        {
            return global::System.Math.Abs(value);
        }
    }
}