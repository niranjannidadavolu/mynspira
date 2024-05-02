namespace Phoenix.CrossCutting.Extension.System.Int64.System.TimeSpan
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a  that represents a specified time, where the specification is in units of ticks.
        /// </summary>
        /// <param name="value">A number of ticks that represent a time.</param>
        /// <returns>An object that represents .</returns>
        public static global::System.TimeSpan FromTicks(this long value)
        {
            return global::System.TimeSpan.FromTicks(value);
        }
    }
}