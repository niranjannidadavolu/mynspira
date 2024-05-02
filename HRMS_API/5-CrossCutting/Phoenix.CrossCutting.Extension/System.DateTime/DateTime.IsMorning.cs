namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that query if '@this' is morning.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if morning, false if not.</returns>
        public static bool IsMorning(this global::System.DateTime @this)
        {
            return @this.TimeOfDay < new global::System.DateTime(2000, 1, 1, 12, 0, 0).TimeOfDay;
        }
    }
}