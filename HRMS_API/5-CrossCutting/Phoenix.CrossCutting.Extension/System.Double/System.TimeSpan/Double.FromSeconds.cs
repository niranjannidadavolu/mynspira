namespace Phoenix.CrossCutting.Extension.System.Double.System.TimeSpan
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a  that represents a specified number of seconds, where the specification is accurate to the nearest
        ///     millisecond.
        /// </summary>
        /// <param name="value">A number of seconds, accurate to the nearest millisecond.</param>
        /// <returns>An object that represents .</returns>
        public static global::System.TimeSpan FromSeconds(this double value)
        {
            return global::System.TimeSpan.FromSeconds(value);
        }
    }
}