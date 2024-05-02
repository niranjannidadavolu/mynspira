namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the hyperbolic cosine of the specified angle.
        /// </summary>
        /// <param name="value">An angle, measured in radians.</param>
        /// <returns>The hyperbolic cosine of . If  is equal to  or ,  is returned. If  is equal to ,  is returned.</returns>
        public static double Cosh(this double value)
        {
            return global::System.Math.Cosh(value);
        }
    }
}