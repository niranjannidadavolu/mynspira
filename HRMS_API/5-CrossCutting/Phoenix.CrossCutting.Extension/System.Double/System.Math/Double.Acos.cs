namespace Phoenix.CrossCutting.Extension.System.Double.System.Math
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the angle whose cosine is the specified number.
        /// </summary>
        /// <param name="d">
        ///     A number representing a cosine, where  must be greater than or equal to -1, but less than or
        ///     equal to 1.
        /// </param>
        /// <returns>An angle, ?, measured in radians, such that 0 ????-or-  if  &lt; -1 or  &gt; 1 or  equals .</returns>
        public static double Acos(this double d)
        {
            return global::System.Math.Acos(d);
        }
    }
}