namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the largest integer less than or equal to the specified double-precision floating-point number.
        /// </summary>
        /// <param name="d">A double-precision floating-point number.</param>
        /// <returns>The largest integer less than or equal to . If  is equal to , , or , that value is returned.</returns>
        public static double Floor(this double d)
        {
            return global::System.Math.Floor(d);
        }
    }
}