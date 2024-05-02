namespace Phoenix.CrossCutting.Extension.System.Double.System.TimeSpan
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a  that represents a specified number of days, where the specification is accurate to the nearest
        ///     millisecond.
        /// </summary>
        /// <param name="value">A number of days, accurate to the nearest millisecond.</param>
        /// <returns>An object that represents .</returns>
        public static global::System.TimeSpan FromDays(this double value)
        {
            return global::System.TimeSpan.FromDays(value);
        }
    }
}