namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the hyperbolic tangent of the specified angle.
        /// </summary>
        /// <param name="value">An angle, measured in radians.</param>
        /// <returns>
        ///     The hyperbolic tangent of . If  is equal to , this method returns -1. If value is equal to , this method
        ///     returns 1. If  is equal to , this method returns .
        /// </returns>
        public static double Tanh(this double value)
        {
            return global::System.Math.Tanh(value);
        }
    }
}