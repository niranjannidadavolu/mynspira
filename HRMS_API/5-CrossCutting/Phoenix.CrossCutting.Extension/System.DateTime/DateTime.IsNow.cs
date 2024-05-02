namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that query if '@this' is now.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if now, false if not.</returns>
        public static bool IsNow(this global::System.DateTime @this)
        {
            return @this == global::System.DateTime.Now;
        }
    }
}