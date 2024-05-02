namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that query if '@this' is in the past.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if the value is in the past, false if not.</returns>
        public static bool IsPast(this global::System.DateTime @this)
        {
            return @this < global::System.DateTime.Now;
        }
    }
}