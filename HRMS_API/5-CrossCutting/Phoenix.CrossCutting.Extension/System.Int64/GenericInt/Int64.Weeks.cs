namespace Phoenix.CrossCutting.Extension.System.Int64.GenericInt
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An Int64 extension method that weeks the given this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>A TimeSpan.</returns>
        public static global::System.TimeSpan Weeks(this long @this)
        {
            return global::System.TimeSpan.FromDays(@this * 7);
        }
    }
}