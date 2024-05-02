namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns e raised to the specified power.
        /// </summary>
        /// <param name="d">A number specifying a power.</param>
        /// <returns>
        ///     The number e raised to the power . If  equals  or , that value is returned. If  equals , 0 is returned.
        /// </returns>
        public static double Exp(this double d)
        {
            return global::System.Math.Exp(d);
        }
    }
}