namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the sine of the specified angle.
        /// </summary>
        /// <param name="a">An angle, measured in radians.</param>
        /// <returns>The sine of . If  is equal to , , or , this method returns .</returns>
        public static double Sin(this double a)
        {
            return global::System.Math.Sin(a);
        }
    }
}